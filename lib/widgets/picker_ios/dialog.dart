import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class DateTimeDialogIos extends StatelessWidget {
  const DateTimeDialogIos(
      {Key? key, required this.visitWanted, required this.visit})
      : super(key: key);

  final List<Visits> visitWanted;
  final Visits visit;

  @override
  Widget build(BuildContext context) {
    DateTime datenow = visit.date ?? DateTime.now();
    var theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 240,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            // width: 250,
            child: CupertinoDatePicker(
              onDateTimeChanged: (selected) {
                var vis = visitWanted.firstWhere((element) => element == visit);
                vis.date = selected;
              },
              initialDateTime:
                  datenow.isBefore(DateTime.now()) ? DateTime.now() : datenow,
              minimumDate: DateTime.now(),
              maximumDate: DateTime.now().add(const Duration(days: 365)),
              backgroundColor: theme.backgroundColor,
              // use24hFormat: true,
              mode: CupertinoDatePickerMode.dateAndTime,
            ),
          ),
        ),
        // SizedBox(
        //   width: double.infinity,
        //   child: CupertinoButton(
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //     color: theme.backgroundColor,
        //     pressedOpacity: 1.0,
        //     child: Text("ok", style: theme.textTheme.headline6?.copyWith(color: theme.primaryColorDark),),
        //   ),
        // ),
      ],
    );
  }
}
