import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/const/const.dart';
// import './sight_card.dart';
import 'package:places/widgets/card_widget.dart';
import 'package:places/mocks.dart';

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
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.red,
        ),
        title: getText(1),
        backgroundColor: CColors.white,
        elevation: 0,
        toolbarHeight: 136,
        titleSpacing: 16,
        primary: false,
      ),
      // drawer: Container(
      //   color: Colors.grey,
      //   width: MediaQuery.of(context).size.width / 2,
      //   child: ListView(
      //     children: getContainers(),
      //     padding: const EdgeInsets.all(5),
      //   ),
      // ),
      body: getBody(),
      // GridView.count(
      //   crossAxisCount: 4,
      //   children: getList(),
      // ),
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
