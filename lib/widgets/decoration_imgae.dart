import 'package:flutter/material.dart';

// class AppDecorationInage extends StatelessWidget {
//   const AppDecorationInage({Key? key, this.boxFit}) : super(key: key);

//   final BoxFit? boxFit;
//   @override
//   Widget build(BuildContext context) {
//     return DecorationImage(
//       image: NetworkImage("imgURL"),
//       fit: BoxFit.cover,
//     );
//   }
// }

// class AppDecorationInage extends DecorationImage {
//   AppDecorationInage({Key? key, fit, required this.img})
//       : super(fit: fit, image: img ??= const NetworkImage(""));

//   ImageProvider<Object>? img;

//   set imageURL(String url) => img = NetworkImage(url);

//   DecorationImage paint() {
//     return DecorationImage(image: img, fit: fit);
//   }
// }

class DecorationNetworkImage extends StatelessWidget {
  const DecorationNetworkImage({Key? key, required this.imgURL, this.fit})
      : super(key: key);

  final String imgURL;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imgURL),
          fit: fit,
        ),
      ),
    );
  }
}

class AppImageConstructor {
  final BoxFit? fit;
  ImageProvider<Object>? img;

  AppImageConstructor({this.img, this.fit});

  set imageURL(String url) => img = NetworkImage(url);

  Widget contained() {
    return Container(
      decoration: BoxDecoration(
        image: image(),
      ),
    );
  }

  DecorationImage image() {
    img ??= const NetworkImage("");
    return DecorationImage(
      image: img!,
      fit: fit,
    );
  }
}
