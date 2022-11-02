import 'package:flutter/material.dart';
import 'package:places/const/icons.dart';
import 'package:places/const/paddings.dart';
import 'package:places/const/texts.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/widgets/appbar/appbar.dart';
import 'package:places/widgets/bottom/bottom.dart';
import 'package:places/widgets/button/buttons.dart';
import 'package:places/widgets/card/min_card.dart';
import 'package:places/widgets/divider/divider.dart';
import 'package:places/widgets/img/svg_icon.dart';
import 'package:places/widgets/pagesbodywidgets/empty_body.dart';
import 'package:places/widgets/text/label_title.dart';
import 'package:places/widgets/text_field/textfield.dart';

class SightSearchScreen extends StatefulWidget {
  const SightSearchScreen({Key? key}) : super(key: key);

  @override
  State<SightSearchScreen> createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  final PageSearchData pageSearchData = PageSearchData();
  @override
  Widget build(BuildContext context) {
    print("${pageSearchData.controller}");
    return Scaffold(
      // backgroundColor: CColors.white,
      appBar: AppBarFindSight(
        title: CTextFileds.listsight,
        widg: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFieldDesigned(
            onSubmited: pageSearchData.onSubmited,
            filled: true,
            predBorderDecoration: false,
            filledColor: Theme.of(context).primaryColorLight,
            controller: pageSearchData.controller,
            maxLenght: 250,
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
      ),
      body: SightSearchBody(pageSearchData: pageSearchData),
      bottomNavigationBar: const AppBottomBar(curentIndex: 2),
    );
  }
}

class SightSearchBody extends StatefulWidget {
  const SightSearchBody({
    Key? key,
    required this.pageSearchData,
  }) : super(key: key);
  final PageSearchData pageSearchData;

  @override
  State<SightSearchBody> createState() => SightSearchBodyState();
}

class SightSearchBodyState extends State<SightSearchBody> {
  @override
  void initState() {
    widget.pageSearchData.funSetState = () {
      setState(() {});
    };
    super.initState();
    widget.pageSearchData.controller.addListener(() {
      widget.pageSearchData.filterByName();
    });
  }

  @override
  void dispose() {
    widget.pageSearchData.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.bodyNormalAll,
      child: (widget.pageSearchData.controller.text != "" &&
              widget.pageSearchData.filteredMock.isEmpty)
          ? const EmptyBody(
              icon: AppIcons.iconSearch,
              text: CTextFileds.modifyParams,
              titleText: CTextFileds.emptyFind)
          : ListView.builder(
              itemCount: widget.pageSearchData.controller.text == ""
                  ? widget.pageSearchData.listLastSearch.length
                  : widget.pageSearchData.filteredMock.length,
              itemBuilder: (BuildContext context, int index) {
                if (widget.pageSearchData.controller.text == "") {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.pageSearchData.listLastSearch.isNotEmpty &&
                          index == 0)
                        const LabelTitleCustom(
                          text: CTextFileds.youSearch,
                        ),
                      FinderListWidget(
                        text: widget.pageSearchData.listLastSearch[index],
                        onClear: () =>
                            widget.pageSearchData.deleteInList2(index),
                        pageSearchData: widget.pageSearchData,
                      ),
                      if (index !=
                          widget.pageSearchData.listLastSearch.length - 1)
                        const DividerDefault(
                          height: 1,
                        ),
                      if (widget.pageSearchData.listLastSearch.isNotEmpty &&
                          index ==
                              widget.pageSearchData.listLastSearch.length - 1)
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () =>
                                  widget.pageSearchData.clearAllList(),
                              child: Text(
                                CTextFileds.clearSearch,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  );
                } else {
                  if (widget.pageSearchData.filteredMock.isEmpty) {
                    return const EmptyBody(
                        icon: AppIcons.iconSearch,
                        text: CTextFileds.modifyParams,
                        titleText: CTextFileds.emptyFind);
                  } else {
                    return MinSightCardv2(
                      sight: widget.pageSearchData.filteredMock[index],
                      ifLast: index ==
                          widget.pageSearchData.filteredMock.length - 1,
                      text: widget.pageSearchData.controller.text,
                      ifOne: widget.pageSearchData.filteredMock.length == 1,
                    );
                  }
                }
              },
            ),
    );
  }

  // void filterByName() {
  //   String inp = widget.pageSearchData.controller.text;
  //   if (inp == "") {
  //     setState(() {});
  //     return;
  //   }
  //   widget.pageSearchData.filteredMock = widget.pageSearchData.mockList
  //       .where((element) => element.name.contains(inp))
  //       .toList();
  //   setState(() {});
  // }

  // void deleteInList2(int index) {
  //   widget.pageSearchData.listLastSearch.removeAt(index);
  //   setState(() {});
  // }

  // void clearAllList() {
  //   widget.pageSearchData.listLastSearch.clear();
  //   setState(() {});
  // }

  // void addAllList() {
  //   widget.pageSearchData.listLastSearch = lastSearch.toList();
  //   setState(() {});
  // }
}

class FinderListWidget extends StatelessWidget {
  final String text;
  final Function() onClear;
  final PageSearchData pageSearchData;
  const FinderListWidget({
    Key? key,
    required this.text,
    required this.onClear,
    required this.pageSearchData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 13),
            child: Stack(
              children: [
                Text(
                  text,
                  style: theme.textTheme.bodyText1
                      ?.copyWith(color: theme.colorScheme.secondaryContainer),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Positioned.fill(
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      highlightColor: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.15),
                      onTap: () {
                        pageSearchData.clickSearchList(text);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SvgButton(
          icon: AppIcons.iconDelete,
          onPressed: onClear,
          iconColor: theme.colorScheme.secondaryContainer,
        )
      ],
    );
  }
}

class PageSearchData {
  TextEditingController controller = TextEditingController();
  List<String> listLastSearch = lastSearch.toList();
  // TextEditingController controller = TextEditingController();
  final List<Sight> mockList = mocksPredef.toList();
  List<Sight> filteredMock = mocksPredef.toList();
  Function()? funSetState;

  // void dispose() {
  //   controller.dispose();
  // }

  void onSubmited(String text) {
    listLastSearch.add(text);
  }

  void filterByName() {
    String inp = controller.text;
    if (inp == "") {
      executeSetState();
      return;
    }
    filteredMock = mockList.where((element) {
      final nameToLowerCase = element.name.toLowerCase();
      return nameToLowerCase.contains(inp.toLowerCase());
    }).toList();
    executeSetState();
  }

  void deleteInList2(int index) {
    listLastSearch.removeAt(index);
    executeSetState();
  }

  void clearAllList() {
    listLastSearch.clear();
    executeSetState();
  }

  void addAllList() {
    listLastSearch = lastSearch.toList();
    executeSetState();
  }

  void executeSetState() {
    if (funSetState != null) {
      funSetState!();
    }
  }

  void clickSearchList(String text) {
    controller.text = text;
    executeSetState();
  }
}
