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
import 'package:places/widgets/scrool/over_scrool_glow_absorber.dart';
import 'package:places/widgets/text_field/textfield.dart';
import 'dart:io' show Platform;

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: CColors.white,
      appBar: AppBarFindSight(
        widg: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
        ),
        title: CTextFileds.listsight,
      ),
      body: const SightListBody(),
      bottomNavigationBar: const AppBottomBar(curentIndex: 2),
    );
  }
}

class SightListBody extends StatelessWidget {
  const SightListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: AppPadding.inputWidgetsInternPadding,
      child: Stack(
        children: [
          // SingleChildScrollView(
          //   child: Column(
          //     children: _getListCards(),
          //   ),
          // ),
          OverScrollGlowAbsorber(
            child: ListView.builder(
              physics: !Platform.isAndroid
                  ? const BouncingScrollPhysics()
                  : const ClampingScrollPhysics(),
              itemCount: mocksPredef.length,
              itemBuilder: (context, index) {
                return SightCard(sight: mocksPredef[index]);
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonConstructor(
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
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
