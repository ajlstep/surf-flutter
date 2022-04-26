import 'domain/sight.dart';

class Mocks {
  final List<Sight> mocks = [];

  Mocks() {
    _init();
  }

  void _init() {
    mocks.add(Sight(
        'Briceni',
        1.1,
        2.2,
        'Брича́ны — город в Молдавии, центр Бричанского района',
        typeSight.city));
    mocks.add(Sight(
        'Mărcăuţi',
        1.1,
        2.2,
        'Маркауцы — село в Бричанском районе Молдавии. Является административным центром коммуны Маркауцы, включающей также село Новые Маркауцы',
        typeSight.city));
    mocks.add(Sight('Colicăuți', 1.1, 2.2, 'empty', typeSight.city));
    mocks.add(Sight(
        'Hlinaia',
        1.1,
        2.2,
        'Хлиная — село в Единецком районе Молдавии. Относится к сёлам, не образующим коммуну.',
        typeSight.city));
    mocks.add(Sight(
        'Zăbriceni',
        1.1,
        2.2,
        'Зэбричень — село в Единецком районе Молдавии. Является административным центром коммуны Зэбричень, включающей также село Онешты',
        typeSight.city));
  }
}
