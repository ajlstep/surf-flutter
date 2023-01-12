import 'package:places/const/icons.dart';
import 'package:places/widgets/appbar/appbar.dart';

import 'package:places/domain/sight.dart';
import 'package:flutter/material.dart';
import 'package:places/widgets/button/back_button.dart';
import 'package:places/widgets/button/buttons.dart';
import 'package:places/const/colors.dart';
import 'package:places/const/texts.dart';
import 'package:places/widgets/img/svg_icon.dart';

// class DetailedPlace extends StatefulWidget {
//   const DetailedPlace({Key? key}) : super(key: key);

//   @override
//   State<DetailedPlace> createState() => _DetailedPlaceState();
// }

class DetailedPlace extends StatelessWidget {
  const DetailedPlace({Key? key, required this.sight, required this.controller})
      : super(key: key);
  final Sight sight;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBarCustom(imgURL: sight.imgURL),
      body: PreBodyWidget(sight: sight, controller: controller),
    );
  }
}

class PreBodyWidget extends StatelessWidget {
  const PreBodyWidget({Key? key, required this.sight, required this.controller})
      : super(key: key);
  final Sight sight;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            CustomSliverAppBar(
              imgURL: sight.imgURL,
              isBottomSheet: true,
            ),
            SliverToBoxAdapter(
              child: BodyWidget(sight),
            ),
          ],
        ),
        Positioned(
          child: Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              boxShadow: [
                BoxShadow(
                  color: theme.dividerColor.withOpacity(0.35),
                  spreadRadius: 3,
                  blurRadius: 0,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
          ),
          top: 20,
          left: MediaQuery.of(context).size.width / 2 - 60.0 / 2,
        ),
        Positioned(
          top: 10.0,
          right: 0.0,
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 16.0),
            child: CloseButtonCustom(
              color: theme.primaryColor,
              onTap: () => Navigator.pop(context),
              size: const Size(40, 40),
              borderRadius: 0,
              icon: SvgIcon(
                assetName: AppIcons.iconDelete,
                color: theme.primaryColorDark,
                height: 30,
                width: 30,
              ),
              boxShadow: [
                BoxShadow(
                  color: theme.dividerColor.withOpacity(0.35),
                  spreadRadius: 3,
                  blurRadius: 0,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BodyWidget extends StatelessWidget {
  final Sight sight;
  const BodyWidget(this.sight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 5),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              sight.name,
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 7,
                    minWidth: 5,
                  ),
                  child: Text(
                    sight.type.name.toString() + " dsadsad sa dsa dsa",
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 1.5,
                    minWidth: 5,
                  ),
                  child: Text(
                    CTextFileds.closeTime,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: CColors.timeOpenText),
                    // style: CTextStyles.smallBold
                    //     .copyWith(color: CColors.timeOpenText),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              sight.details,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 24,
            ),
            ButtonConstructor(
              onPressed: () {},
              icon: const Icon(
                Icons.account_tree_rounded,
                color: CColors.backGround,
              ),
              text: Text(
                CButtonTexts.placeRoute,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: CColors.backGround),
              ),
              backgroundColor: CColors.green,
              separatorWidth: 10,
            ),
            const SizedBox(
              height: 16,
            ),
            Divider(
              height: 16,
              color: CColors.divider.withOpacity(0.24),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonConstructor(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.calendar_month,
                    // size: 55,
                    color: CColors.buttZaplanirovati,
                  ),
                  text: Text(
                    CButtonTexts.schedule,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: CColors.buttZaplanirovati),
                  ),
                  separatorWidth: 10,
                ),
                ButtonConstructor(
                  onPressed: () {},
                  text: Text(CButtonTexts.addFavorite,
                      style: Theme.of(context).textTheme.bodyText2),
                  icon: const Icon(
                    Icons.linked_camera,
                    color: CColors.textColor,
                  ),
                  separatorWidth: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
