import 'package:flutter/material.dart';

import '../Constants/custom_colors.dart';

class TitleDailog extends StatelessWidget {
  String message;
  Function cancelFunction;

  TitleDailog(this.message, this.cancelFunction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 350,
        decoration: BoxDecoration(color: CustomColors.white, borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              decoration: BoxDecoration(
                  color: CustomColors.btnBlueColor,
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(20),
                      topEnd: Radius.circular(20),
                      bottomEnd: Radius.circular(0),
                      bottomStart: Radius.circular(0))),
              width: double.infinity,
              height: 50,
              child: Row(children: <Widget>[
                Text(
                  "Alert!",
                  style: TextStyle(
                    color: CustomColors.white,
                    fontSize: 16,
                  ),
                ),
                Flexible(fit: FlexFit.tight, child: const SizedBox()),
                IconButton(
                  icon: Icon(
                    Icons.close_rounded,
                    color: CustomColors.white,
                    size: 24.0,
                  ),
                  onPressed: () {
                    cancelFunction();
                  },
                )
              ])),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CustomColors.black,
                fontSize: 16,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
