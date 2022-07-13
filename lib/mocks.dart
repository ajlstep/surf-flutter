import 'package:flutter/material.dart';
import 'package:places/domain/coordonate.dart';

import 'domain/sight.dart';

// class mocksPredef {
//   final List<Sight> mocksPredef = [];

//   mocksPredef() {
//     _init();
//   }

//   void _init() {
//     mocksPredef.add(Sight(
//       'Briceni',
//       1.1,
//       2.2,
//       'Брича́ны — город в Молдавии, центр Бричанского района',
//       listTypeSight[typeSight.cafe]!,
//       [
//         'https://diez.md/wp-content/uploads/2018/08/32387297_2524526401106307_730940100191453184_o-920x613.jpg'
//       ],
//     ));
//     mocksPredef.add(Sight(
//       'Colicăuți pentru text lunc am scris mai mult si mai trebuie putin si inca putin si gata pentru rindul al trei-lea',
//       1.1,
//       2.2,
//       'Маркауцы — село в Бричанском районе Молдавии. Является административным центром коммуны Маркауцы, включающей также село Новые Маркауцы Маркауцы — село в Бричанском районе Молдавии. Является административным центром коммуны Маркауцы, включающей также село Новые Маркауцы Маркауцы — село в Бричанском районе Молдавии. Является административным центром коммуны Маркауцы, включающей также село Новые Маркауцы Маркауцы — село в Бричанском районе Молдавии. Является административным центром коммуны Маркауцы, включающей также село Новые Маркауцы Маркауцы — село в Бричанском районе Молдавии. Является административным центром коммуны Маркауцы, включающей также село Новые Маркауцы Маркауцы — село в Бричанском районе Молдавии. Является административным центром коммуны Маркауцы, включающей также село Новые Маркауцы Маркауцы — село в Бричанском районе Молдавии. Является административным центром коммуны Маркауцы, включающей также село Новые Маркауцы Маркауцы — село в Бричанском районе Молдавии. Является административным центром коммуны Маркауцы, включающей также село Новые Маркауцы',
//       listTypeSight[typeSight.hotel]!,
//       ['https://diez.md/wp-content/uploads/2020/02/propaganda1.jpg'],
//     ));
//     mocksPredef.add(Sight(
//       'Mărcăuţi',
//       1.1,
//       2.2,
//       'empty',
//       listTypeSight[typeSight.museum]!,
//       ['https://diez.md/wp-content/uploads/2020/02/smokehouse.jpg'],
//     ));
//     mocksPredef.add(Sight(
//       'Hlinaia',
//       1.1,
//       2.2,
//       'Хлиная — село в Единецком районе Молдавии. Относится к сёлам, не образующим коммуну.',
//       listTypeSight[typeSight.park]!,
//       [
//         'https://i0.wp.com/manastireahincu.md/wp-content/uploads/2016/12/viber-image.jpg'
//       ],
//     ));
//     mocksPredef.add(Sight(
//       'Zăbriceni',
//       1.1,
//       2.2,
//       'Зэбричень — село в Единецком районе Молдавии. Является административным центром коммуны Зэбричень, включающей также село Онешты',
//       listTypeSight[typeSight.particularplace]!,
//       [
//         'https://i0.wp.com/manastireahincu.md/wp-content/uploads/2016/12/viber-image.jpg'
//       ],
//     ));
//     mocksPredef.add(Sight(
//       'Zăbriceni2',
//       1.1,
//       2.2,
//       'Зэбричень — село в Единецком районе Молдавии. Является административным центром коммуны Зэбричень, включающей также село Онешты',
//       listTypeSight[typeSight.restaurant]!,
//       [
//         'https://i0.wp.com/manastireahincu.md/wp-content/uploads/2016/12/viber-image.jpg'
//       ],
//     ));
//     mocksPredef.add(Sight(
//       'Zăbriceni2',
//       1.1,
//       2.2,
//       'Зэбричень — село в Единецком районе Молдавии. Является административным центром коммуны Зэбричень, включающей также село Онешты',
//       listTypeSight[typeSight.restaurant]!,
//       [
//         'https://i0.wp.com/manastireahincu.md/wp-content/uploads/2016/12/viber-image.jpg'
//       ],
//     ));
//   }
// }

// class VisitList {
//   List<Visits> g() {
//     List<Visits> _list = [];
//     var _rnd = Random();
//     for (var item in mocksPredef) {
//       _list.add(Visits(item, _rnd.nextBool()));
//     }
//     return _list;
//   }
// }

// ignore: non_constant_identifier_names
List<Visits> VisitList = [
  Visits(mocksPredef[0], true, DateTime.parse("2012-02-27 15:24")),
  Visits(mocksPredef[1], true, DateTime.parse("2012-03-27 09:00")),
  Visits(mocksPredef[2], false, DateTime.parse("2012-04-27 11:00")),
  Visits(mocksPredef[3], false, DateTime.parse("2012-05-27 09:00")),
  Visits(mocksPredef[4], true, DateTime.parse("2012-06-27 10:00")),
];

final List<Sight> mocksPredef = [
  Sight(
    'Radisson Blu Leogrand Hotel',
    listTypeSight[typeSight.hotel]!,
    [
      'http://photos.wikimapia.org/p/00/08/45/73/36_big.jpg',
    ],
    'Этот отель расположен в самом центре города, рядом со знаменитым собором Рождества Христова и зданием Парламента Кишинёва. К услугам гостей бесплатная парковка, бесплатный Wi-Fi и элегантный ресторан. Кроме того, гости могут бесплатно посещать фитнес-центр и спа-центр.',
    47.02453323537953,
    28.83674466942646,
  ),
  Sight(
    'Mi piace',
    listTypeSight[typeSight.restaurant]!,
    [
      'https://mipiace.md/wp-content/uploads/slider5/Mi-Piace-535.jpeg',
      'https://mipiace.md/wp-content/uploads/2018/09/Mi-Piace-546.jpg',
      'https://mipiace.md/wp-content/uploads/2018/09/Mi-Piace-555.jpg',
    ],
    'Ресторан Mi Piace для эстетов-гурманов. Ресторан Mi Piace находится рядом с самым красивым местом Кишенева – Долиной Роз. Ресторан Mi Piace пронизан особой атмосферой европейского аристократизма и утонченного шика.',
    46.99868135843299,
    28.857941840590414,
  ),
  Sight(
    'Weekend Boutique Hotel',
    listTypeSight[typeSight.hotel]!,
    [
      'https://cf.bstatic.com/xdata/images/hotel/max1280x900/11607575.jpg?k=ffe03f739e3f30238a5908d48a245570bce656e439048b08580e58168a82d0b2&o=&hp=1',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/c1/07/3f/lobby.jpg?w=1200&h=-1&s=1',
    ],
    'Номера бутик-отеля Weekend индивидуально оформлены в элегантном стиле 1950-х годов. Во всех номерах есть кондиционер, спутниковое телевидение, рабочая зона и современная ванная комната.',
    46.9206268,
    28.8205367,
  ),
  Sight(
    'Парк "Штефан чел Маре"',
    listTypeSight[typeSight.park]!,
    [
      'https://www.viza.md/sites/default/files/images/04_Parc_St_cel_Mare_070512_003.JPG',
      'https://www.dudu.md/pic/product/2020/04/18/31925e99e943a1bd4.jpg',
      'http://photos.wikimapia.org/p/00/07/63/83/85_big.jpg',
    ],
    '«Штефан чел Маре» - центральный парк в Кишиневе. Кроме того, это одна из интереснейших достопримечательностей города и популярное место отдыха кишиневцев.',
    47.02562223331627,
    28.828305260604864,
  ),
  Sight(
    'Национальный музей этнографии Кишинёва',
    listTypeSight[typeSight.museum]!,
    [
      'https://moldovatur.md/wp-content/uploads/2020/01/MoldovaTur_Chisinau_Ethnographic_Museum.jpg',
      'https://www.moldpres.md/uploads/news/2019/09/19/19007381_big1568902957.jpg',
      'https://1.bp.blogspot.com/-kJMxGgYLFM4/XFsHIk8XUtI/AAAAAAAAGuQ/PN1HDeol4iUFXFacTpJ2kp9EgD1dzsVbQCLcBGAs/s1600/moldavskaya-svadiba-v-muzee-etnografii-i-naturalinoi-istorii.jpg',
    ],
    'Национальный музей этнографии и естественной истории Кишинёва гордо носит звание самого старого музея Молдавии (действует с 1889 г.). Нынешнее его здание было построено в 1905 г. по проекту архитектора В. Цыганко и единственное в Молдавии выполнено в псевдо-мавританском стиле.',
    47.02343032841899,
    28.819900169426464,
  ),
  Sight(
    'Mojito',
    listTypeSight[typeSight.cafe]!,
    [
      'https://citylive.md/img/2020/07/30420045_364149454083299_7330388823847263159_o.jpg',
      'https://www.fest.md/files/places/4/image_476_10_preview.jpg',
      'https://www.fest.md/files/places/4/image_476_20_preview.jpg',
    ],
    'Аргентина и Япония  ближе как никогда к вам, в самом центре Кишинёва. Насладитесь кулинарным удовольствием, выбрав ароматный стейк приготовленный по уникальному аргентинскому рецепту, или побалуйте себя свежим суши, специально приготовленным для вас.',
    47.050852201188384,
    28.863491211756607,
  ),
  Sight(
    'Парк Дендрарий',
    listTypeSight[typeSight.park]!,
    [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/42/bf/f7/photo2jpg.jpg?w=1200&h=-1&s=1',
      'https://s13.stc.yc.kpcdn.net/share/i/4/2151657/wr-750.webp',
      'https://media-cdn.tripadvisor.com/media/photo-m/1280/14/19/ef/2b/caption.jpg',
    ],
    'Идеальный семейный отдых можно провести в парке Дендрарий. Парк Дендрарий живописный, каждое дерево, куст или цветок цепляют взгляд, в нём расслабляешься, наслаждаешься свежим воздухом и отпускаешь все неприятные мысли.',
    47.03289998044136,
    28.8101806270972,
  ),
  Sight(
    'Сквер с панорамным видом на Чеканах',
    listTypeSight[typeSight.particularplace]!,
    [
      'https://i.simpalsmedia.com/point.md/news/thumbnails/large/954c6ca923e004538cb6f02f2e34543b.jpg',
      'https://i.simpalsmedia.com/point.md/news/thumbnails/large/a9d5bdeab7670e3f380c3e715832df2a.jpg',
    ],
    'Сквер с панорамным видом на город на улице Марии Дрэган в секторе Чеканы превратился в современное пространство для отдыха.',
    47.014222164812324,
    28.882793093465622,
  ),
  Sight(
    'Национальный Музей Археологии и Истории Молдовы',
    listTypeSight[typeSight.particularplace]!,
    [
      'https://www.fest.md/files/places/2/image_217_5_large.jpg',
      'https://ic.pics.livejournal.com/zhidchenko22/82890995/32986/32986_original.jpg',
    ],
    'Музей был открыт в 1987 г. в здании бывшего Регионального Лицея, находящемся в историческом центре Кишинёва. Перед зданием установлен памятник Латинской волчице с Ромулом и Ремом – точная копия знаменитого римского монумента.',
    47.02272544411117,
    28.828110040591103,
  ),
  Sight(
    'Кафе-Бар "Caffe Graffiti"',
    listTypeSight[typeSight.cafe]!,
    [
      'http://www.prospect.md/images/business/kafe-bar-caffe-graffiti_thumb.jpg',
      'http://www.resto.md/images/stories/places/221-caffe-graffiti/caffe-graffiti-chisinau-7.jpg',
      'https://i.simpalsmedia.com/point_files/files/0245e7e3fd19313b54b25fb2e679e12d.jpg',
    ],
    'Стильная и комфортная атмосфера, непринуждённая и лишённая малейших церемоний, в сочетании с отменной японской и итальянской кухней и достойным сервисом – вот что сделает посетителей «Caffe Graffiti» постоянными.',
    46.999925603446755,
    28.842870369425754,
  ),
];

const Coordonate mocksPredefCurrentLocation =
    Coordonate(47.0243841, 28.8367543);

const ThemeMode mocksThemeMode = ThemeMode.light;

List<String> lastSearch = [
  "Кофейня у Рустама",
  "Рускеала",
  "Музей истории Российской Федерации",
  "Зелёные рощи",
];
