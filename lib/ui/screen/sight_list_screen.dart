import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/const/const.dart';
// import './sight_card.dart';
import 'package:places/widgets/card_widget.dart';
import 'package:places/mocks.dart';
import '../../widgets/appbar.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.white,
      appBar: AppBarNormal(title: getText(1)),
      body: getBody(),
    );
  }
}

Widget getBody() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
    child: SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: getListCards(),
      ),
    ),
  );
}

Widget getText(int a) {
  if (a == 0) {
    return getSimpleText();
  } else {
    return getRichText();
  }
}

Widget getSimpleText() {
  return const Padding(
    padding: EdgeInsets.fromLTRB(16, 64, 16, 20),
    child: Text(
      CTexts.text,
      style: CTextStyles.largeTitle,
      textAlign: TextAlign.left,
    ),
  );
}

Widget getRichText() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 64, 16, 20),
    child: RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        style: CTextStyles.largeTitle,
        children: getInlineSpan(),
      ),
    ),
  );
}

List<TextSpan> getInlineSpan() {
  List<TextSpan> list = [];
  for (var item in CTexts.textAndColors.entries) {
    list.add(TextSpan(
      text: item.key,
      style: TextStyle(
        color: item.value,
      ),
    ));
  }
  return list;
}

List<Widget> getListCards() {
  List<Widget> list = [];
  Mocks mocks = Mocks();
  for (var item in mocks.mocks) {
    list.add(SightCard(sight: item));
  }
  return list;
}
