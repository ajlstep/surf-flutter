// import 'package:flutter/material.dart';

import 'package:places/const/settings.dart';

// class CIcons {
//   static const card = "res/icons/empty_pages/card.svg";
//   static const clear = "res/icons/empty_pages/clear.svg";
//   static const go = "res/icons/empty_pages/go.svg";
//   static const map = "res/icons/empty_pages/map.svg";
//   static const search = "res/icons/empty_pages/search.svg";
//   static const calendar = "res/icons/other/calendar.svg";
//   static const heart = "res/icons/menu/heart.svg";
//   static const share = "res/icons/other/share.svg";
//   static const list = "res/icons/menu/list.svg";
//   static const settings = "res/icons/menu/settings.svg";
//   static const heartfull = "res/icons/menu/heart_full.svg";
//   CIcons._();
// }

/// Иконки приложения
class AppIcons {
  // иконки для пустых страниц
  static const String emptyPageCard = '$_path/empty_pages/card.svg';
  static const String emptyPageClear = '$_path/empty_pages/clear.svg';
  static const String emptyPageGo = '$_path/empty_pages/go.svg';
  static const String emptyPageMap = '$_path/empty_pages/map.svg';
  static const String emptyPageSearch = '$_path/empty_pages/search.svg';

  // иконки меню
  static const String menuHeart = '$_path/menu/heart.svg';
  static const String menuHeartFull = '$_path/menu/heart_full.svg';
  static const String menuList = '$_path/menu/list.svg';
  static const String menuListFull = '$_path/menu/list_full.svg';
  static const String menuMap = '$_path/menu/map.svg';
  static const String menuMapFull = '$_path/menu/map_full.svg';
  static const String menuSettings = '$_path/menu/settings.svg';
  static const String menuSettingsFull = '$_path/menu/settings_full.svg';

  // иконки категории
  static const String categoryCafe = '$_path/catalog/cafe.svg';
  static const String categoryHotel = '$_path/catalog/hotel.svg';
  static const String categoryMuseum = '$_path/catalog/museum.svg';
  static const String categoryPark = '$_path/catalog/park.svg';
  static const String categoryParticularPlace =
      '$_path/catalog/particular_place.svg';
  static const String categoryRestaurant = '$_path/catalog/restaurant.svg';

  // остальные иконки
  static const String iconCalendar = '$_pathOther/calendar.svg';
  static const String iconCalendarFull = '$_pathOther/calendar_full.svg';
  static const String iconClose = '$_pathOther/close.svg';
  static const String iconShare = '$_pathOther/share.svg';
  static const String iconGo = '$_pathOther/go.svg';
  static const String iconArrow = '$_pathOther/arrow.svg';
  static const String iconFail = '$_pathOther/fail.svg';
  static const String iconTick = '$_pathOther/tick.svg';
  static const String iconTickChoice = '$_pathOther/tick_choice.svg';
  static const String iconInfo = '$_pathOther/info.svg';
  static const String iconView = '$_pathOther/view.svg';
  static const String iconClear = '$_pathOther/clear.svg';
  static const String iconPlus = '$_pathOther/plus.svg';
  static const String iconDelete = '$_pathOther/delete.svg';
  static const String iconSearch = "$_pathOther/search.svg";
  static const String iconFilter = "$_pathOther/filter.svg";
  static const String iconBucket = "$_pathOther/bucket.svg";

  static const String _path = AppSettings.pathIcons;
  static const String _pathOther = '$_path/other';

  String getIconForFile(String icon) {
    return "$_path/catalog/$icon";
  }

  // AppIcons._();
}
