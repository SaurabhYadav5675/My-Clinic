import 'dart:convert';
import 'dart:math';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Utility {
  static String decodeString(String data) {
    data = data.replaceAll("%(?![0-9a-fA-F]{2})", "%25");
    String finalString = data;
    try {
      finalString = Uri.decodeFull(utf8.decode(finalString.runes.toList()));
    } catch (e) {}
    return finalString;
  }

  static String getFileNameFromURL(String fileUrl) {
    var fileName = "";
    if (fileUrl.isNotEmpty) {
      int startIndex = fileUrl.lastIndexOf('/') + 1;
      int length = fileUrl.length;

      int postFix = fileUrl.lastIndexOf('?'); // find end index for ?
      if (postFix == -1) {
        postFix = length;
      }

      int postFixHash = fileUrl.lastIndexOf('#'); // find end index for #
      if (postFixHash == -1) {
        postFixHash = length;
      }

      int endIndex = min(postFix, postFixHash);
      fileName = fileUrl.substring(startIndex, endIndex);
    }
    return fileName;
  }

  static void ToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static double stringToDouble(String data) {
    double value = 0;
    bool isNumeric = double.tryParse(data) != null;
    if (isNumeric) {
      value = double.parse(data);
    }
    return value;
  }

  static String getResError(String response) {
    String error = "";
    if (response.isNotEmpty) {
      final res = json.decode(response);
      if (res.containsKey("message")) {
        error = res['message'];
      }
    }
    return error;
  }

  static String stringDateConverter(date, format) {
    DateTime selectedDate = DateTime.parse(date);
    String formatedDate = "";
    try {
      formatedDate = DateFormat(format).format(selectedDate);
    } catch (error) {
      formatedDate = "";
    }
    return formatedDate;
  }
}
