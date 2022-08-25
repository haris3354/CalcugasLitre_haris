import 'package:flutter/material.dart';
import '../utils/asset_path.dart';

class BackgroundImageWidget extends StatelessWidget {
  final Widget child;
  final ImageProvider? backgroundImage;
  BackgroundImageWidget({required this.child, this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: backgroundImage ?? const AssetImage(AssetPath.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: child,
      ),
    );
  }
}
