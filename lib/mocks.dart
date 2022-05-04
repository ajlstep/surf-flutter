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
      typeSight.country,
      'https://diez.md/wp-content/uploads/2018/08/32387297_2524526401106307_730940100191453184_o-920x613.jpg',
    ));
    mocks.add(Sight(
      'Colicăuți pentru text lunc am scris mai mult si mai trebuie putin si inca putin si gata pentru rindul al trei-lea',
      1.1,
      2.2,
      'Маркауцы — село в Бричанском районе Молдавии. Является административным центром коммуны Маркауцы, включающей также село Новые Маркауцы',
      typeSight.city,
      'https://diez.md/wp-content/uploads/2020/02/propaganda1.jpg',
    ));
    mocks.add(Sight(
      'Mărcăuţi',
      1.1,
      2.2,
      'empty',
      typeSight.city,
      'https://diez.md/wp-content/uploads/2020/02/smokehouse.jpg',
    ));
    mocks.add(Sight(
      'Hlinaia',
      1.1,
      2.2,
      'Хлиная — село в Единецком районе Молдавии. Относится к сёлам, не образующим коммуну.',
      typeSight.city,
      'https://i0.wp.com/manastireahincu.md/wp-content/uploads/2016/12/viber-image.jpg',
    ));
    mocks.add(Sight(
      'Zăbriceni',
      1.1,
      2.2,
      'Зэбричень — село в Единецком районе Молдавии. Является административным центром коммуны Зэбричень, включающей также село Онешты',
      typeSight.city,
      'https://i0.wp.com/manastireahincu.md/wp-content/uploads/2016/12/viber-image.jpg',
    ));
  }
}
