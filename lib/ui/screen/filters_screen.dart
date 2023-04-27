import 'package:flutter/material.dart';
import 'package:places/const/texts.dart';
import 'package:places/providers/filterprovider.dart';
import 'package:places/widgets/appbar/appbar.dart';
import 'package:places/widgets/button/buttons.dart';
import 'package:places/widgets/button/filter_button.dart';
import 'package:places/widgets/slider/filter_slider.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarVisitingFilter(
        clearTap: Provider.of<Filters>(context, listen: false).clear,
      ),
      body: const FiltersScreenBody(),
    );
  }
}

class FiltersScreenBody extends StatelessWidget {
  const FiltersScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // var s = Provider.of<Filters>(context, listen: false);
    // return _gridViewDemo();
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("КАТЕГРОИИ"),
          const SizedBox(
            height: 24,
          ),
          Consumer<Filters>(
            builder: (context, value, child) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 3,
                //   crossAxisSpacing: 20.0,
                //   mainAxisSpacing: 20.0,
                //   childAspectRatio: 1.3,
                // ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 125,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1.3,
                ),
                itemCount: value.mocks.length,
                itemBuilder: (context, index) {
                  return GridTile(
                    footer: Center(
                      child: Text(
                        value.mocks[index].name,
                        style: theme.textTheme.caption
                            ?.copyWith(color: theme.colorScheme.onSecondary),
                      ),
                    ),
                    child: Center(
                      child: FilterButtonPredefined(
                        context: context,
                        onTaps: () {
                          // _onTap(s.mocks[index]);
                          value.pressType(value.mocks[index]);
                        },
                        sight: value.mocks[index],
                        visible: value.selectedTypeSight
                            .contains(value.mocks[index]),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(
            height: 60,
          ),
          FilterSlider(
            // context: context,
            startValue: 100,
            endValue: 10000,
          ),
          const Spacer(),
          ButtonConstructor(
            backgroundColor: theme.colorScheme.tertiary,
            onPressed: () {},
            text: Consumer<Filters>(
              builder: (context, value, child) => Text(
                "${CTextFileds.view} (${value.count.toString()})",
                style: theme.textTheme.subtitle1
                    ?.copyWith(color: theme.primaryColor),
              ),
            ),
          ),
          // Selector<Filters, double>(
          //   selector: (context, filter) => filter.distanceEnd,
          //   builder: (context, value, child) => Text(value.toString()),
          // ),
          // Consumer<Filters>(builder: ((context, value, child) {
          //   return Text(
          //     value.distanceStart.toString(),
          //   );
          // })),
        ],
      ),
    );
  }
}

// class Filters extends ChangeNotifier {
//   final List<TypeSyght> _mocks = listTypeSight.values.toList();
//   final List<TypeSyght> _selectedTypeSight = [];
//   List<Sight> _filteredSight = [];
//   double distanceStart = 100;
//   double distanceEnd = 10000;
//   final double min = 100;
//   final double max = 10000;
//   final _myCoord = mocksPredefCurrentLocation;

//   int get count => _filteredSight.length;
//   List<TypeSyght> get mocks => _mocks;
//   List<TypeSyght> get selectedTypeSight => _selectedTypeSight;
//   List<Sight> get filteredSight => _filteredSight;

//   void clear() {
//     _selectedTypeSight.clear();
//     distanceStart = min;
//     distanceEnd = max;
//     filterAndNotify();
//   }

//   void _selectType(TypeSyght typeS) {
//     _selectedTypeSight.add(typeS);
//   }

//   void _unselectType(TypeSyght typeS) {
//     _selectedTypeSight.remove(typeS);
//   }

//   void filterAndNotify() {
//     _filteredSight = mocksPredef
//         .where(
//           (element) =>
//               _selectedTypeSight.contains(element.type) &&
//               returnData(element, distanceStart, distanceEnd),
//           /*Coordonate(element.lat, element.lon)
//                   .ifNear(_myCoord, distanceStart / 1000, distanceEnd / 1000) &&
//               Coordonate(element.lat, element.lon)
//                   .ifNrear2(_myCoord, distanceStart, distanceEnd),*/
//         )
//         .toList();
//     notifyListeners();
//   }

//   bool returnData(element, distanceStart, distanceEnd) {
//     // final dist1 = Coordonate(element.lat, element.lon)
//     //     .ifNear(_myCoord, distanceStart / 1000, distanceEnd / 1000);

//     final dist2 = Coordonate(element.lat, element.lon)
//         .ifNrear2(_myCoord, distanceStart, distanceEnd);

//     return dist2;
//   }

//   void pressType(TypeSyght typeS) {
//     if (_selectedTypeSight.contains(typeS)) {
//       _unselectType(typeS);
//     } else {
//       _selectType(typeS);
//     }
//     filterAndNotify();
//   }

//   void changeDistance(double start, double end) {
//     distanceStart = start;
//     distanceEnd = end;
//     filterAndNotify();
//   }
// }
