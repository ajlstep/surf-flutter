import 'package:places/widgets/appbar/appbar.dart';

import 'package:places/mocks.dart';
import 'package:places/domain/sight.dart';
import 'package:flutter/material.dart';
import 'package:places/widgets/button/buttons.dart';
import 'package:places/const/textstyle.dart';
import 'package:places/const/colors.dart';
import 'package:places/const/texts.dart';

class DetailedPlace extends StatefulWidget {
  const DetailedPlace({Key? key}) : super(key: key);

  @override
  State<DetailedPlace> createState() => _DetailedPlaceState();
}

class _DetailedPlaceState extends State<DetailedPlace> {
  final _sight = Mocks().mocks[1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(imgURL: _sight.imgURL[0]),
      body: BodyWidget(_sight),
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
              style: CTextStyles.title,
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 8,
                    minWidth: 5,
                  ),
                  child: Text(
                    sight.type.name.toString() + " dsadsad sa dsa dsa",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: CTextStyles.smallBold,
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
                    style: CTextStyles.smallBold
                        .copyWith(color: CColors.timeOpenText),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              sight.details,
              style: CTextStyles.smallBold,
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
                style:
                    CTextStyles.smallBold.copyWith(color: CColors.backGround),
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
                    style: CTextStyles.small
                        .copyWith(color: CColors.buttZaplanirovati),
                  ),
                  separatorWidth: 10,
                ),
                ButtonConstructor(
                  onPressed: () {},
                  text: const Text(CButtonTexts.addFavorite,
                      style: CTextStyles.small),
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
