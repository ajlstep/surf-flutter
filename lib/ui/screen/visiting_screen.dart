import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:places/const/paddings.dart';
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
              padding: AppPadding.inputWidgetsInternPadding,
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
  List<Visits> visitWanted = [];
  List<Visits> visits = [];

  @override
  void initState() {
    super.initState();
    visitWanted = widget.visitList.where((element) => element.visit).toList();
    visits = widget.visitList.where((element) => !element.visit).toList();
  }

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
            : paintCard3(visitWanted, true),
        visits.isEmpty
            ? const EmptyBody(
                icon: AppIcons.emptyPageGo,
                titleText: CTextFileds.empty,
                text: CTextFileds.emptyVisit,
              )
            : paintCard3(visits, false),
      ],
    );
  }

  Widget paintCard(List<Visits> vlist, bool isWant) {
    return Padding(
      padding: AppPadding.inputWidgetsInternPadding,
      child: SingleChildScrollView(
        child: Column(
          children: _getListCards(vlist, isWant),
        ),
      ),
    );
  }

  Widget paintCard2(List<Visits> vlist, bool isWant) {
    return ReorderableListView(
      buildDefaultDragHandles: false,
      padding: AppPadding.inputWidgetsInternPadding,
      children: _getListCards(vlist, isWant),
      onReorder: fnOnReorder(vlist),
    );
  }

  Widget paintCard3(List<Visits> vlist, bool isWant) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getNymCol(context),
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0),
      // buildDefaultDragHandles: false,
      padding: AppPadding.inputWidgetsInternPadding,
      children: _getListCards(vlist, isWant),
      // onReorder: fnOnReorder(vlist),
    );
  }

  int getNymCol(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait ? 1 : 2;
  }

  Function(int, int) fnOnReorder(List<Visits> vlist) {
    return (int oldIndex, int newIndex) {
      setState(() {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final Visits item = vlist.removeAt(oldIndex);
        vlist.insert(newIndex, item);
      });
    };
  }

  List<Widget> _getListCards(List<Visits> vlist, bool isWant) {
    List<Widget> list = [];
    for (var item in vlist) {
      if (isWant) {
        list.add(
          Container(
            key: Key(item.sight.name),
            child: WantVisitSightCard(
              onCalendar: calendarSightAction,
              visits: item,
              onDelete: deleteSightAction,
            ),
          ),
        );
      } else {
        list.add(
          Container(
            key: Key(item.sight.name),
            child: VisitSightCard(
              visits: item,
              onDelete: deleteSightAction2,
            ),
          ),
        );
      }
    }
    return list;
  }

  Function() deleteSightAction(Visits visit) {
    return () {
      setState(() {
        visitWanted.remove(visit);
      });
    };
  }

  Function() calendarSightAction(Visits visit) {
    return () async {
      DateTime datenow = visit.date ?? DateTime.now();
      TimeOfDay timenow = visit.date == null
          ? TimeOfDay.now()
          : TimeOfDay.fromDateTime(datenow);

      var date = await showDatePicker(
          context: context,
          initialDate:
              datenow.isBefore(DateTime.now()) ? DateTime.now() : datenow,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)));
      if (date != null) {
        var time = await showTimePicker(context: context, initialTime: timenow);
        if (time != null) {
          date = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
          setState(() {
            var vis = visitWanted.firstWhere((element) => element == visit);
            vis.date = date;
          });
        }
      }
    };
  }

  Function deleteSightAction2(Visits visit) {
    return () {
      setState(() {
        visits.remove(visit);
      });
    };
  }
}
