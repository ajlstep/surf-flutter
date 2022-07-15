import 'package:flutter/material.dart';
import 'package:places/const/colors.dart';

class CTitleTexts {
  static const text = "Список\nинтересных мест";
  static const Map<String, Color?> textAndColors = {
    "С": CColors.green,
    "писок\n": null,
    "и": CColors.yelow,
    "нтересных мест": null,
  };
  static const titleFavorite = "Избранное";
  CTitleTexts._();
}

class CButtonTexts {
  static const placeRoute = "ПОСТРОИТЬ МАРШРУТ";
  static const schedule = "Запланировать";
  static const addFavorite = "В Избранное";

  CButtonTexts._();
}

class CTextFileds {
  static const closeTime =
      "закрыто до 19:00 fdsfds fds fsd fsd fds dsadsadsad asd";
  static const empty = "Пусто";
  static const emptywantVisit =
      "Отмечайте понравившиеся места и они появиятся здесь.";
  static const emptyVisit = "Завершите маршрут, чтобы место попало сюда.";
  static const closed = "закрыто до 09:00";
  static const sheduled = "Запланировано на";
  static const reached = "Цель достигнута";
  static const distance = "Расстояние";
  static const view = "ПОКАЗАТЬ";
  static const settings = "Настройки";
  static const darkTheme = "Тёмная тема";
  static const viewTutorial = "Смотреть туториал";
  // static const newPlace = "Новое место";
  static const unselected = "Не выбрано";
  static const category = "КАТЕГОРИЯ";
  static const name = "НАЗВАНИЕ";
  static const lon = "ШИРОТА";
  static const lat = "ДОЛГОТА";
  static const pointmap = "Указать на карте";
  static const description = "ОПИСАНИЕ";
  static const create = "СОЗДАТЬ";
  static const listsight = "Список интересных мест";
  static const newPlace = "НОВОЕ МЕСТО";
  static const clearSearch = "Очистить историю";
  static const youSearch = "ВЫ ИСКАЛИ";
  static const modifyParams = "Попробуйте изменить параметры поиска";
  static const emptyFind = "Ничего не найдено.";
  static const delete = "Удалить";
  CTextFileds._();
}

class CLabelText {
  static const wantVisit = "Хочу посутить";
  static const visit = "Посетил";

  CLabelText._();
}
