import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places/const/icons.dart';
import 'package:places/const/paddings.dart';
import 'package:places/const/texts.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/sight_search_screen.dart';
import 'package:places/utils/data_objects/app_bar_dimensions.dart';
import 'package:places/widgets/bottom/bottom.dart';
import 'package:places/widgets/button/buttons.dart';
import 'package:places/widgets/card/card_widget.dart';
import 'package:places/mocks.dart';
import 'package:places/widgets/appbar/appbar.dart';
import 'package:places/widgets/img/svg_icon.dart';
import 'package:places/widgets/text_field/textfield.dart';

class SightListScreenSliver extends StatefulWidget {
  const SightListScreenSliver({Key? key}) : super(key: key);

  @override
  State<SightListScreenSliver> createState() => _SightListScreenSliverState();
}

class _SightListScreenSliverState extends State<SightListScreenSliver> {
  TextEditingController controller = TextEditingController();
  final ScrollController _contr = ScrollController();
  late AppBarAnimateData animData;
  final double width = 210;

  @override
  void initState() {
    animData = AppBarAnimateData(
      setState: () {
        setState(() {});
      },
      maxValue: 32,
      minValue: 18,
      maxValue2: 64,
      minValue2: 1,
      width: width,
      isDesktop: Platform.isLinux || Platform.isWindows || Platform.isMacOS,
      context: context,
    )..obst = width / 1.6;
    _contr.addListener(() {
      animData.mutval = _contr.offset;
      setState(() {});
    });
    controller.addListener(() {
      controller.text = "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        controller: _contr,
        slivers: [
          SliverAppBarFindSight(
            animData: animData,
            widg: null,
          ),
          SliverAppBar(
            flexibleSpace: searchWidget(),
            expandedHeight: 1,
          ),
          const SightListSliverBody(),
        ],
      ),
      floatingActionButton: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 48, maxWidth: 177),
        child: ButtonConstructor(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddSightScreen(),
              ),
            );
          },
          text: Text(
            CTextFileds.newPlace,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Theme.of(context).primaryColor),
          ),
          icon: SvgIcon(
            assetName: AppIcons.iconPlus,
            color: theme.primaryColorLight,
          ),
          separatorWidth: 8,
          shappe: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget searchWidget() {
    return Padding(
      padding: animData.isPortrait
          ? AppPadding.inputWidgetsInternPadding
          : AppPadding.inputWidgetsInternPaddingLandscape,
      child: TextFieldDesigned(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SightSearchScreen(),
            ),
          );
        },
        hintText: "Пойск",
        filled: true,
        predBorderDecoration: false,
        filledColor: Theme.of(context).primaryColorLight,
        controller: controller,
        maxLenght: 250,
        suffixWidget: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgIcon(
            assetName: AppIcons.iconFilter,
            color: Theme.of(context).colorScheme.tertiary,
            height: 24,
            width: 24,
          ),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.all(10.0),
          child: SvgIcon(
            assetName: AppIcons.iconSearch,
            color: Colors.black,
            height: 24,
            width: 24,
          ),
        ),
      ),
    );
  }
}

class SightListSliverBody extends StatelessWidget {
  const SightListSliverBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SliverList(
      delegate:
          SliverChildListDelegate(List.generate(mocksPredef.length, (index) {
        return SightCard(sight: mocksPredef[index]);
      })),
    );
  }

  List<Widget> _getListCards() {
    List<Widget> list = [];
    List<Sight> mocks = mocksPredef;
    for (var item in mocks) {
      list.add(SightCard(sight: item));
    }
    return list;
  }
}
