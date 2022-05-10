import 'package:places/widgets/appbar.dart';

import '../../mocks.dart';
import '../../domain/sight.dart';
import 'package:flutter/material.dart';
import 'package:places/const/const.dart';
import 'package:places/widgets/buttons.dart';

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
                    "закрыто до 19:00 fdsfds fds fsd fsd fds dsadsadsad asd",
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
                "ПОСТРОИТЬ МАРШРУТ",
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
                    "Запланировать",
                    style: CTextStyles.small
                        .copyWith(color: CColors.buttZaplanirovati),
                  ),
                  separatorWidth: 10,
                ),
                ButtonConstructor(
                  onPressed: () {},
                  text: const Text("В Избранное", style: CTextStyles.small),
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
