import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/widgets/appbar/appbar.dart';
import 'package:places/widgets/appbar/tabbar/tabbar.dart';
import 'package:places/widgets/pagesbodywidgets/empty_body.dart';
import 'package:places/const/texts.dart';
import 'package:places/const/icons.dart';
import 'package:places/domain/sight.dart';
import 'package:places/widgets/card/card_widget.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:places/const/settings.dart';
import 'package:places/widgets/bottom/bottom.dart';

class VisitingScreen extends StatelessWidget {
  final List<Visits> visitList;
  const VisitingScreen({Key? key, required this.visitList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = AppSettings.defaultLocale;
    initializeDateFormatting(AppSettings.defaultLocale);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBarVisiting(
          title: Center(
            child: Text(
              CTitleTexts.titleFavorite,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          bottomBar: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: TabBarVisitingWidget(tablist: _tabs),
            ),
          ),
        ),
        body: VisitingScreenBody(visitList: visitList),
        bottomNavigationBar: const AppBottomBar(curentIndex: 2),
      ),
    );
  }

  List<Widget> get _tabs {
    return const [
      Tab(
        text: CLabelText.wantVisit,
      ),
      Tab(
        text: CLabelText.visit,
      ),
    ];
  }
}

class VisitingScreenBody extends StatefulWidget {
  final List<Visits> visitList;

  const VisitingScreenBody({Key? key, required this.visitList})
      : super(key: key);

  @override
  State<VisitingScreenBody> createState() => _VisitingScreenBodyState();
}

class _VisitingScreenBodyState extends State<VisitingScreenBody> {
  List<Visits> get visitWanted =>
      widget.visitList.where((element) => element.visit).toList();

  List<Visits> get visit =>
      widget.visitList.where((element) => !element.visit).toList();

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        visitWanted.isEmpty
            ? const EmptyBody(
                icon: AppIcons.emptyPageCard,
                titleText: CTextFileds.empty,
                text: CTextFileds.emptywantVisit,
              )
            : paintCard(visitWanted, true),
        visit.isEmpty
            ? const EmptyBody(
                icon: AppIcons.emptyPageGo,
                titleText: CTextFileds.empty,
                text: CTextFileds.emptyVisit,
              )
            : paintCard(visit, false),
      ],
    );
  }

  Widget paintCard(List<Visits> vlist, bool isWant) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: SingleChildScrollView(
        child: Column(
          children: _getListCards(vlist, isWant),
        ),
      ),
    );
  }

  List<Widget> _getListCards(List<Visits> vlist, bool isWant) {
    List<Widget> list = [];
    for (var item in vlist) {
      if (isWant) {
        list.add(WantVisitSightCard(
          visits: item,
          onDelete: deleteSightAction,
        ));
      } else {
        list.add(VisitSightCard(
          visits: item,
          onDelete: deleteSightAction,
        ));
      }
    }
    return list;
  }

  Function deleteSightAction(Visits visit) {
    return () {
      setState(() {
        widget.visitList.remove(visit);
      });
    };
  }
}
