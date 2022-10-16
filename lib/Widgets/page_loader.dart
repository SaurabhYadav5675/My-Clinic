import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Constants/custom_colors.dart';

class PageLoader extends StatelessWidget {
  const PageLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Align(
        alignment: Alignment.center,
        child: SpinKitFadingCircle(
          color: CustomColors.colorBlue,
          size: 70.0,
        ),
      ),
    );
  }
}
