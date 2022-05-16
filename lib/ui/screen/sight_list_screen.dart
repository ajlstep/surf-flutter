import 'package:flutter/material.dart';
import 'package:places/const/texts.dart';
import 'package:places/const/colors.dart';
import 'package:places/const/textstyle.dart';
import 'package:places/widgets/card/card_widget.dart';
import 'package:places/mocks.dart';
import 'package:places/widgets/appbar/appbar.dart';

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
      appBar: AppBarNormal(title: getRichText()),
      body: const SightListBody(),
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
    for (var item in CTitleTexts.textAndColors.entries) {
      list.add(TextSpan(
        text: item.key,
        style: TextStyle(
          color: item.value,
        ),
      ));
    }
    return list;
  }
}

class SightListBody extends StatelessWidget {
  const SightListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: SingleChildScrollView(
        child: Column(
          children: _getListCards(),
        ),
      ),
    );
  }

  List<Widget> _getListCards() {
    List<Widget> list = [];
    Mocks mocks = Mocks();
    for (var item in mocks.mocks) {
      list.add(SightCard(sight: item));
    }
    return list;
  }
}
