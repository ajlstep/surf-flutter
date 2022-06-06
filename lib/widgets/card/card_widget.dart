import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/const/texts.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_detailed.dart';
import 'package:places/widgets/img/decoration_image.dart';
import 'package:places/const/textstyle.dart';
import 'package:places/const/colors.dart';
import 'package:places/const/gradients.dart';
import 'package:places/const/icons.dart';
import 'package:places/widgets/img/svg_icon.dart';
import 'package:places/const/settings.dart';
import 'package:intl/date_symbol_data_local.dart';

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
                        getTypeWiget(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              0, 28 - 9.5 - 16, 28 - 9.5 - 16, 0),
                          child: Row(
                            children: getListImagedButton(),
                          ),
                        ),
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
        ],
      ),
    );
  }

  Widget getTypeWiget() {
    return Text(
      sight.type.name.toString(),
      style: CTextStyles.smallBold.copyWith(
        color: CColors.white,
      ),
    );
  }

  List<Widget> getListImagedButton() {
    return const [
      SvgIcon(
        assetName: AppIcons.menuHeart,
        height: 24,
        width: 24,
        color: CColors.white,
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
  List<Widget> getListImagedButton() {
    return const [
      SvgIcon(
        assetName: AppIcons.iconShare,
        height: 24,
        width: 24,
        color: CColors.white,
      ),
      SizedBox(
        width: 17,
      ),
      SvgIcon(
        assetName: AppIcons.menuHeart,
        height: 24,
        width: 24,
        color: CColors.white,
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
  List<Widget> getListImagedButton() {
    return const [
      SvgIcon(
        assetName: AppIcons.iconCalendar,
        height: 24,
        width: 24,
        color: CColors.white,
      ),
      SizedBox(
        width: 17,
      ),
      SvgIcon(
        assetName: AppIcons.menuHeart,
        height: 24,
        width: 24,
        color: CColors.white,
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
