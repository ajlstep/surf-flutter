import 'package:flutter/material.dart';

class CustomTabIndicator extends StatelessWidget {
  final TabController controller;
  const CustomTabIndicator({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        for (int i = 0; i < controller.length; i++)
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.57),
                color: controller.index == i
                    ? theme.colorScheme.primary
                    : theme.colorScheme.surface.withOpacity(0.0),
              ),
              height: 8,
            ),
          ),
      ],
    );
  }
}
