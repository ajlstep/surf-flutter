import 'package:flutter/material.dart';
import 'package:places/const/icons.dart';
import 'package:places/const/paddings.dart';
import 'package:places/const/texts.dart';
import 'package:places/providers/addprovider.dart';
import 'package:places/utils/formaters/add_formater.dart';
import 'package:places/widgets/appbar/appbar.dart';
import 'package:places/widgets/button/buttons.dart';
import 'package:places/widgets/divider/divider.dart';
import 'package:places/widgets/img/svg_icon.dart';
import 'package:places/widgets/text/label_title.dart';
// import 'package:places/widgets/text_field/clear_text_controller.dart';
import 'package:places/widgets/text_field/textfield.dart';
import 'package:provider/provider.dart';

class AddSightScreen extends StatelessWidget {
  const AddSightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarNewSight(
        title: CTextFileds.newPlace,
      ),
      // body: Provider(
      //   create: (context) => AddSight(),
      //   child: const _AddSightBody(),
      // ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AddSight()),
        ],
        child: const _AddSightBody(),
      ),
      // resizeToAvoidBottomInset: false,
    );
  }
}

class _AddSightBody extends StatefulWidget {
  const _AddSightBody({Key? key}) : super(key: key);

  @override
  State<_AddSightBody> createState() => _AddSightBodyState();
}

class _AddSightBodyState extends State<_AddSightBody> {
  // final TextEditingController _controller = TextEditingController();
  late PageTextControlers _pageContr;
  late AddSight provider;
  late List<FocusNode> focusList;
  List<String> lst = myList.toList();
  @override
  void initState() {
    super.initState();
    _pageContr = PageTextControlers();
    provider = Provider.of<AddSight>(context, listen: false);
    focusList = [FocusNode(), FocusNode(), FocusNode(), FocusNode()];
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AddSight>(context, listen: false);
    var theme = Theme.of(context);
    return LayoutBuilder(
      builder: ((context, constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: AppPadding.bodyNormalAll,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - 32,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: getList(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LabelTitleCustom(
                          text: CTextFileds.category,
                        ),
                        ListTile(
                          contentPadding: AppPadding.padding0All,
                          title: Text(
                            CTextFileds.unselected,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                          ),
                          selected: true,
                          trailing: SvgButtonCustom(
                            onPressed: () {},
                            icon: AppIcons.iconView,
                            iconColor: Colors.black,
                            iconPadding: 10,
                          ),
                        ),
                        const DividerDefault(height: 1),
                        const SizedBox(
                          height: 24,
                        ),
                        const LabelTitleCustom(
                          text: CTextFileds.name,
                        ),
                        // const SizedBox(
                        //   height: 12,
                        // ),

                        TextFieldDesigned(
                          maxLenght: 50,
                          controller: _pageContr.cntrName,
                          onSubmited: nextFocus,
                          focusNode: focusList[0],
                          fAddToOnChanged: provider.modName,

                          // onChanged:
                          //     provider.modName(_pageContr.cntrName.text ?? ''),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        // const LabelTitleCustom(
                        //   text: CTextFileds.name,
                        // ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const LabelTitleCustom(
                                    text: CTextFileds.lon,
                                  ),
                                  // const SizedBox(
                                  //   height: 12,
                                  // ),
                                  TextFieldDesigned(
                                    maxLenght: 12,
                                    isNumeric: true,
                                    onSubmited: nextFocus,
                                    focusNode: focusList[1],
                                    controller: _pageContr.cntrLon,
                                    inputFormaters:
                                        _pageContr.inputFormatersLon,
                                    fAddToOnChanged: provider.modLon,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const LabelTitleCustom(
                                    text: CTextFileds.lat,
                                  ),
                                  // const SizedBox(
                                  //   height: 12,
                                  // ),
                                  TextFieldDesigned(
                                    maxLenght: 12,
                                    onSubmited: nextFocus,
                                    focusNode: focusList[2],
                                    isNumeric: true,
                                    controller: _pageContr.cntrLat,
                                    inputFormaters:
                                        _pageContr.inputFormatersLat,
                                    fAddToOnChanged: provider.modLat,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            CTextFileds.pointmap,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),

                        const LabelTitleCustom(
                          text: CTextFileds.description,
                        ),
                        // const SizedBox(
                        //   height: 12,
                        // ),
                        // SizedBox(
                        //   height: 50,
                        // ),
                        TextFieldDesigned(
                          maxLenght: 350,
                          multiLine: true,
                          onSubmited: nextFocus,
                          focusNode: focusList[3],
                          controller: _pageContr.cntrDescription,
                          fAddToOnChanged: provider.modDescription,
                        ),
                      ],
                    ),
                    // Spacer(),
                    Consumer<AddSight>(
                      builder: (context, value, child) => ButtonConstructor(
                        onPressed:
                            value.ifCheck ? () => print("add sight") : null,
                        text: Text(
                          CTextFileds.create,
                          style: theme.textTheme.subtitle1?.copyWith(
                              color: value.ifCheck
                                  ? theme.primaryColorLight
                                  : theme.colorScheme.background),
                        ),
                        backgroundColor: value.ifCheck
                            ? theme.colorScheme.tertiary
                            : theme.primaryColorLight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void nextFocus(String txt) {
    for (var i = 0; i < focusList.length - 1; i++) {
      if (i == focusList.length - 1 && focusList[i].hasFocus) {
        focusList[i].unfocus();
        return;
      }
      if (focusList[i].hasFocus) {
        focusList[i + 1].requestFocus();
        return;
      }
    }
  }

  Function(TapUpDetails) deletePhoto(String obj) {
    return (TapUpDetails details) {
      setState(() {
        lst.remove(obj);
      });
    };
  }

  Function(DismissDirection) dimisPhoto(String obj) {
    return (DismissDirection details) {
      setState(() {
        lst.remove(obj);
      });
    };
  }

  void addPhoto(TapUpDetails det) {
    setState(() {
      for (var element in myList) {
        if (lst.indexOf(element) == -1) {
          lst.add(element);
          break;
        }
      }
    });
  }

  List<Widget> getList() {
    bool ifFirst = true;
    List<Widget> myLst = [];
    for (var el in lst) {
      ifFirst
          ? myLst.add(
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTapUp: addPhoto,
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            )
          : myLst.add(
              Dismissible(
                key: ValueKey(el),
                direction: DismissDirection.up,
                onDismissed: dimisPhoto(el),
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6),
                          child: GestureDetector(
                            key: ValueKey(el),
                            onTapUp: deletePhoto(el),
                            child: const SvgIcon(
                              assetName: AppIcons.iconClear,
                              color: Colors.white,
                              width: 23,
                              height: 23,
                            ),
                          ),
                        ),
                        Text(
                          el,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
      ifFirst ? ifFirst = !ifFirst : null;
    }
    return myLst;
  }
}

class PageTextControlers {
  final TextEditingController cntrCategory = TextEditingController();
  final TextEditingController cntrName = TextEditingController();
  final TextEditingController cntrLat = TextEditingController();
  final TextEditingController cntrLon = TextEditingController();
  final TextEditingController cntrDescription = TextEditingController();
  final inputFormatersLon = [SightLocationFormater(ifLong: false)];
  final inputFormatersLat = [SightLocationFormater(ifLong: true)];
}

List<String> myList = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
];
