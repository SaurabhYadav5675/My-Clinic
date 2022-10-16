import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UtilityWidgets {
  static Widget verticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }

  static Widget horizontalSpace(double width) {
    return SizedBox(
      width: width,
    );
  }

  static TextStyle textFieldStyle(fontSize, fontColor) {
    return TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: fontColor,
    );
  }

  static TextStyle textFieldStyleBold(fontSize, fontColor) {
    return TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: fontColor,
    );
  }

  static InputDecoration textFieldDecoration(label, hint, borderRadius, borderSide, icon) {
    /*borderRadius = borderRadius.todouble();
    borderSide = borderSide.todouble();*/
    return InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: Colors.deepPurple,
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide(color: Colors.deepPurpleAccent, width: borderSide)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide(color: Colors.deepPurple, width: borderSide)));
  }

  static ButtonStyle roundCornerBlueOutline({required vertical, required horizontal}) {
    vertical = vertical.toDouble();
    horizontal = horizontal.toDouble();
    return ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal)),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(
            color: Colors.deepPurple,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  static Container topRoundedButtonDesign(title, radius, padding, fontSize, fontColor) {
    radius = radius.toDouble();
    return Container(
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(radius), topRight: Radius.circular(radius))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              decoration: TextDecoration.underline, fontSize: fontSize, fontWeight: FontWeight.w700, color: fontColor),
        ),
      ),
    );
  }

  static SizedBox circularImageUrl(width, height, imgUrl) {
    return SizedBox(
      height: height.toDouble(),
      width: width.toDouble(),
      child: FittedBox(
          fit: BoxFit.contain,
          child: CircleAvatar(
            maxRadius: 80.0,
            backgroundImage: Image.network(
              imgUrl,
              fit: BoxFit.cover,
            ).image,
          )),
    );
  }

  static SizedBox circularImageAssets(width, height, imgAssets) {
    return SizedBox(
      height: height.toDouble(),
      width: width.toDouble(),
      child: FittedBox(
          fit: BoxFit.contain,
          child: CircleAvatar(
            maxRadius: 80.0,
            backgroundImage: Image.asset(
              imgAssets,
              fit: BoxFit.cover,
            ).image,
          )),
    );
  }
}
