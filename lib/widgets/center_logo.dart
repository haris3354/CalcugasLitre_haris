import 'package:flutter/material.dart';
import '../utils/asset_path.dart';

class CenterLogo extends StatelessWidget {
  final double logoWidth;
  final double logoHeight;

  const CenterLogo(
      {super.key, required this.logoWidth, required this.logoHeight});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetPath.logo,
      width: logoWidth,
      height: logoHeight,
    );
  }
}
