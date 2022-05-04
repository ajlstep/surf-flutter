import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/const/const.dart';
// import './sight_card.dart';
import 'package:places/widgets/card_widget.dart';
import 'package:places/mocks.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.red,
        ),
        title: getText(1),
        backgroundColor: CColors.white,
        elevation: 0,
        toolbarHeight: 136,
        titleSpacing: 16,
        primary: false,
      ),
      // drawer: Container(
      //   color: Colors.grey,
      //   width: MediaQuery.of(context).size.width / 2,
      //   child: ListView(
      //     children: getContainers(),
      //     padding: const EdgeInsets.all(5),
      //   ),
      // ),
      body: getBody(),
      // GridView.count(
      //   crossAxisCount: 4,
      //   children: getList(),
      // ),
    );
  }
}

Widget getBody() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
    child: SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: getListCards(),
      ),
    ),
  );
}

Widget getText(int a) {
  if (a == 0) {
    return getSimpleText();
  } else {
    return getRichText();
  }
}

Widget getSimpleText() {
  return const Padding(
    padding: EdgeInsets.fromLTRB(16, 64, 16, 20),
    child: Text(
      CTexts.text,
      style: CTextStyles.largeTitle,
      textAlign: TextAlign.left,
    ),
  );
}

Widget getRichText() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 64, 16, 20),
    child: RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        style: CTextStyles.largeTitle,
        children: getInlineSpan(),
      ),
    ),
  );
}

List<TextSpan> getInlineSpan() {
  List<TextSpan> list = [];
  for (var item in CTexts.textAndColors.entries) {
    list.add(TextSpan(
      text: item.key,
      style: TextStyle(
        color: item.value,
      ),
    ));
  }
  return list;
}

List<Widget> getListCards() {
  List<Widget> list = [];
  Mocks mocks = Mocks();
  for (var item in mocks.mocks) {
    list.add(CardWidget(sight: item));
  }
  return list;
}

// List<Widget> getContainers() {
//   return <Widget>[
//     Container(
//       color: Colors.blue,
//       child: const Text('one'),
//       height: 25,
//     ),
//     Container(
//       color: Colors.yellow,
//       child: const Text('two'),
//       height: 50,
//     ),
//     Container(
//       color: Colors.green,
//       child: const Text('three'),
//       height: 35,
//     ),
//     Container(
//       color: Colors.deepOrange,
//       child: const Center(child: Text('four')),
//       height: 150,
//     ),
//     TextField(),
//   ];
// }

// List<Widget> getList() {
//   return [
//     getContainer(
//         text: 'Хочу посетить',
//         url:
//             'https://media.istockphoto.com/photos/young-woman-looking-through-window-at-home-picture-id1305630245'),
//     getContainer(
//         text: 'Хочу посетить',
//         url:
//             'https://media.istockphoto.com/photos/the-city-of-london-skyline-at-night-united-kingdom-picture-id1312550959'),
//     getContainer(
//         text: 'Хочу посетить',
//         url:
//             'https://media.istockphoto.com/photos/young-woman-looking-through-window-at-home-picture-id1305630245'),
//     getContainer(
//         text: 'Хочу посетить',
//         url:
//             'https://media.istockphoto.com/photos/the-city-of-london-skyline-at-night-united-kingdom-picture-id1312550959'),
//     getContainer(
//         text: 'Хочу посетить',
//         url:
//             'https://media.istockphoto.com/photos/young-woman-looking-through-window-at-home-picture-id1305630245'),
//     getContainer(
//         text: 'Хочу посетить',
//         url:
//             'https://media.istockphoto.com/photos/the-city-of-london-skyline-at-night-united-kingdom-picture-id1312550959'),
//   ];
// }

// Widget getContainer({required String text, url}) {
//   var ret = Container(
//     padding: const EdgeInsets.all(5),
//     child: Container(
//       alignment: Alignment.bottomCenter,
//       child: TextButton(
//         onPressed: () {},
//         child: Text(
//           text,
//           style: const TextStyle(
//             color: Colors.amberAccent,
//           ),
//         ),
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(2),
//         color: Colors.deepPurpleAccent,
//         image: DecorationImage(
//           image: NetworkImage(url),
//           fit: BoxFit.fill,
//         ),
//       ),
//     ),
//   );
//   return ret;
// }

// Widget createCard({required String name, subname, required IconData ic}) {
//   var cd = Card(
//     child: Container(
//       // height: 100,
//       color: Colors.white,
//       child: Container(
//         color: Colors.red,
//         child: Row(
//           children: [
//             Center(
//               child: Expanded(
//                 child: Icon(ic),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 alignment: Alignment.topLeft,
//                 child: Container(
//                   color: Colors.blueGrey,
//                   child: Column(
//                     children: [
//                       Expanded(
//                         flex: 5,
//                         child: ListTile(
//                           title: Text(name),
//                           subtitle: Text(subname),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 5,
//                         child: Container(
//                           color: Colors.yellow,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               TextButton(
//                                 onPressed: () {},
//                                 child: const Text('ok'),
//                                 style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.all(
//                                         const Color.fromARGB(
//                                             255, 236, 168, 128))),
//                               ),
//                               TextButton(
//                                 onPressed: () {},
//                                 child: const Text('cancel'),
//                                 style: ButtonStyle(
//                                   backgroundColor: MaterialStateProperty.all(
//                                       const Color.fromARGB(255, 155, 228, 153)),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
//   return cd;
// }