import 'package:flutter/material.dart';
import 'package:places/const/colors.dart';

class AppImageConstructor {
  final BoxFit? fit;
  final String imgURL;
  double? opacity;
  Gradient? gradient;

  AppImageConstructor(
      {required this.imgURL, this.fit, this.opacity, this.gradient});

  Widget image() {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.network(
            imgURL,
            fit: fit,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return SizedBox.square(
                dimension: 40,
                child: Align(
                  child: CircularProgressIndicator(
                    color: CColors.incativeBlack.withOpacity(1),
                    backgroundColor: CColors.backGround,
                    strokeWidth: 6,
                  ),
                ),
              );
            },
          ),
        ),
        if (_fixWithOpacity()) _addOpacity(),
      ],
    );
  }

  bool _fixWithOpacity() {
    return opacity != null && gradient != null;
  }

  Widget _addOpacity() {
    return Opacity(
        opacity: opacity!,
        child: Container(
          decoration: BoxDecoration(gradient: gradient),
        ));
  }
}
