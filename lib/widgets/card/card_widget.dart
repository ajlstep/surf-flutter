import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/const/texts.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_detailed.dart';
import 'package:places/widgets/button/buttons.dart';
import 'package:places/widgets/img/decoration_image.dart';
import 'package:places/const/textstyle.dart';
import 'package:places/const/colors.dart';
import 'package:places/const/gradients.dart';
import 'package:places/const/icons.dart';
import 'package:places/const/settings.dart';

class SightCard extends StatelessWidget {
  final Sight sight;
  const SightCard({Key? key, required this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: DecoratedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: AppImageConstructor(
                        fit: BoxFit.cover,
                        imgURL: sight.imgURL[0],
                        opacity: 0.4,
                        gradient: CGradients.whiteImageGradient)
                    .image(),
              ),
              decoration: const BoxDecoration(
                color: CColors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 3 / 2,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getTypeWiget(context),
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(
                        //       0, 28 - 9.5 - 16, 28 - 9.5 - 16, 0),
                        //   child: Row(
                        //     children: getListImagedButton(),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      color: CColors.backGround,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          // const SizedBox(
                          //   height: 96,
                          // ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: getColumnListText(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                highlightColor:
                    Theme.of(context).colorScheme.background.withOpacity(0.15),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailedPlace(
                            sight: sight,
                          )));
                },
              ),
            ),
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: getListImagedButton(context),
            ),
          )),
        ],
      ),
    );
  }

  Widget getTypeWiget(BuildContext context) {
    return Text(
      sight.type.name.toString(),
      style: CTextStyles.smallBold.copyWith(
        color: Theme.of(context).backgroundColor,
      ),
    );
  }

  List<Widget> getListImagedButton(BuildContext context) {
    return [
      SvgButton(
        icon: AppIcons.menuHeart,
        onPressed: () {},
        // iconColor: Colors.red,
        iconColor: Theme.of(context).primaryColor,
        splashColor: Theme.of(context).colorScheme.background.withOpacity(1),
        // splashColor: Colors.red,
        top: 10,
        right: 10,
      ),
    ];
  }

  List<Widget> getColumnListText() {
    return [
      Text(
        sight.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: CTextStyles.text.copyWith(),
      ),
      const SizedBox(
        height: 2,
      ),
      Text(
        sight.details,
        style: CTextStyles.small.copyWith(
          color: CColors.smallText,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    ];
  }
}

class VisitSightCard extends SightCard {
  late Visits visits;
  VisitSightCard({Key? key, required this.visits})
      : super(key: key, sight: visits.sight);

  @override
  List<Widget> getListImagedButton(BuildContext context) {
    return [
      SvgButton(
        top: 10,
        right: 10,
        icon: AppIcons.iconShare,
        onPressed: () {},
        iconColor: Theme.of(context).primaryColor,
        splashColor: Theme.of(context).colorScheme.background.withOpacity(1),
      ),
      SvgButton(
        top: 10,
        right: 10,
        icon: AppIcons.menuHeart,
        onPressed: () {},
        iconColor: Theme.of(context).primaryColor,
        splashColor: Theme.of(context).colorScheme.background.withOpacity(1),
      ),
    ];
  }

  @override
  List<Widget> getColumnListText() {
    return [
      Text(
        sight.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: CTextStyles.text.copyWith(),
      ),
      const SizedBox(
        height: 2,
      ),
      Text(
        "${CTextFileds.reached} ${DateFormat(AppSettings.dateFormatAbrMonth).format(
          visits.date,
        )}",
        // CTextFileds.sheduled +
        //     DateFormat(AppSettings.dateFormatAbrMonth).format(
        //       visits.date,
        //     ),
        style: CTextStyles.small.copyWith(
          color: CColors.green,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      const SizedBox(
        height: 2,
      ),
      Text(
        CTextFileds.closed,
        style: CTextStyles.small.copyWith(
          color: CColors.whiteSecondary2,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    ];
  }
}

class WantVisitSightCard extends SightCard {
  late Visits visits;
  WantVisitSightCard({Key? key, required this.visits})
      : super(key: key, sight: visits.sight);

  @override
  List<Widget> getListImagedButton(BuildContext context) {
    return [
      SvgButton(
        icon: AppIcons.iconCalendar,
        onPressed: () {},
        // iconColor: Colors.red,
        iconColor: Theme.of(context).primaryColor,
        splashColor: Theme.of(context).colorScheme.background.withOpacity(1),
        // splashColor: Colors.red,
        top: 10,
        right: 10,
      ),
      // const SizedBox(
      //   width: 17,
      // ),
      SvgButton(
        icon: AppIcons.menuHeart,
        onPressed: () {},
        // iconColor: Colors.red,
        iconColor: Theme.of(context).primaryColor,
        splashColor: Theme.of(context).colorScheme.background.withOpacity(1),
        // splashColor: Colors.red,
        top: 10,
        right: 10,
      ),
    ];
  }

  @override
  List<Widget> getColumnListText() {
    return [
      Text(
        sight.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: CTextStyles.text.copyWith(),
      ),
      const SizedBox(
        height: 2,
      ),
      Text(
        "${CTextFileds.sheduled} ${DateFormat(AppSettings.dateFormatAbrMonth).format(
          visits.date,
        )}",
        style: CTextStyles.small.copyWith(
          color: CColors.green,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      const SizedBox(
        height: 2,
      ),
      Text(
        CTextFileds.closed,
        style: CTextStyles.small.copyWith(
          color: CColors.whiteSecondary2,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    ];
  }
}


// DateFormat(AppSettings.dateFormatAbrMonth).format(
//                       favoriteSight.date!,
//                     )
