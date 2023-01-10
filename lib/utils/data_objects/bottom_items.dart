import 'package:places/const/icons.dart';

class BottomItems {
  late String assetName;
  late String label;
  BottomItems({required this.assetName, required this.label});

  double get height => 24;
  double get width => 24;
  String get route => "/" + label;
}

class BootomItemsList {
  late List<BottomItems> list;
  BootomItemsList() {
    init();
  }
  void init() {
    list = get();
  }

  List<BottomItems> get() {
    List<BottomItems> list = [
      BottomItems(label: "list", assetName: AppIcons.menuList),
      BottomItems(label: "settings", assetName: AppIcons.menuMap),
      BottomItems(label: "visiting", assetName: AppIcons.menuHeartFull),
      BottomItems(label: "settings", assetName: AppIcons.menuSettings),
    ];

    return list;
  }
}
