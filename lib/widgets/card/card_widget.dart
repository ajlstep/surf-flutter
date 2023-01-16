import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/const/paddings.dart';
import 'package:places/const/sizes.dart';
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
import 'package:places/widgets/img/svg_icon.dart';

class SightCard extends StatelessWidget {
  final Sight sight;
  final bool isDismisible;
  const SightCard({
    Key? key,
    required this.sight,
    this.isDismisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.addSightExtern,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: DecoratedBox(
              child: ClipRRect(
                borderRadius: AppSizes.borderCircular15,
                child: Padding(
                  padding: AppPadding.inputWidgetsInternPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: SvgIcon(
                              assetName: AppIcons.iconBucket,
                            ),
                          ),
                          Text(
                            CTextFileds.delete,
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(
                                    color: Theme.of(context).primaryColorLight),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.error,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
            ),
          ),
          Dismissible(
            key: ValueKey(sight.name),
            direction: isDismisible
                ? DismissDirection.endToStart
                : DismissDirection.none,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 3 / 2,
                  child: DecoratedBox(
                    child: ClipRRect(
                      borderRadius: AppSizes.borderCircular15,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                      highlightColor: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.15),
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => DetailedPlace(
                        //           sight: sight,
                        //         )));
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => DraggableScrollableSheet(
                            snap: true,
                            initialChildSize: 0.8,
                            builder: (context, scrollController) {
                              return DetailedPlace(
                                sight: sight,
                                controller: scrollController,
                              );
                            },
                          ),
                          isScrollControlled: true,
                          // constraints: BoxConstraints(
                          //     maxHeight:
                          //         MediaQuery.of(context).size.height * 0.7),
                        );
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
                  ),
                ),
              ],
            ),
            onDismissed: onDel,
          ),
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

  void onDel(DismissDirection dir) {}
}

class VisitSightCard extends SightCard {
  late Visits visits;
  final Function(Visits)? onShare;
  final Function(Visits)? onDelete;
  VisitSightCard({Key? key, required this.visits, this.onShare, this.onDelete})
      : super(key: key, sight: visits.sight, isDismisible: true);

  @override
  void onDel(DismissDirection dir) {
    var fn = onDelete != null ? onDelete!(visits) : null;
    if (fn != null) {
      fn();
    }
  }

  @override
  List<Widget> getListImagedButton(BuildContext context) {
    return [
      SvgButton(
        top: 10,
        right: 10,
        icon: AppIcons.iconShare,
        onPressed: onShare != null ? onShare!(visits) : null,
        iconColor: Theme.of(context).primaryColor,
        splashColor: Theme.of(context).colorScheme.background.withOpacity(1),
      ),
      SvgButton(
        top: 10,
        right: 10,
        icon: AppIcons.menuHeart,
        onPressed: onDelete != null ? onDelete!(visits) : null,
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
      if (visits.date != null)
        Text(
          "${CTextFileds.reached} ${DateFormat(AppSettings.dateFormatAbrMonth).format(
            visits.date!,
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
  final Function(Visits)? onCalendar;
  final Function(Visits)? onDelete;
  WantVisitSightCard({
    Key? key,
    required this.visits,
    this.onCalendar,
    this.onDelete,
  }) : super(key: key, sight: visits.sight, isDismisible: true);

  @override
  void onDel(DismissDirection dir) {
    var fn = onDelete != null ? onDelete!(visits) : null;
    if (fn != null) {
      fn();
    }
  }

  @override
  List<Widget> getListImagedButton(BuildContext context) {
    return [
      SvgButton(
        icon: AppIcons.iconCalendar,
        onPressed: onCalendar != null ? onCalendar!(visits) : null,
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
        onPressed: onDelete != null ? onDelete!(visits) : null,
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
      if (visits.date != null)
        Text(
          "${CTextFileds.sheduled} ${DateFormat(AppSettings.dateFormatAbrMonth).format(
            visits.date!,
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
