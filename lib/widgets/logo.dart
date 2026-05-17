import 'package:flutter/material.dart';

class CipherUnitImage extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit fit;

  const CipherUnitImage({
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;

    final imagePath = isDark
        ? "assets/images/cipher_unit.png"
        :"assets/images/cipher_unit_dark.png" ;

    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
    );
  }
}



class PeakMovieImage extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit fit;

  const PeakMovieImage({
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;

    final imagePath = isDark
        ? "assets/images/logo.png"
        :"assets/images/logo.png" ;

    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
