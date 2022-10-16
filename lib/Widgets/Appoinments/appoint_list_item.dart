import 'package:flutter/material.dart';
import 'package:my_clinic/Constants/custom_colors.dart';
import 'package:my_clinic/Utilities/Utility.dart';
import 'package:my_clinic/Widgets/utility_widgets.dart';

import '../../Models/home_screen_model.dart';
import 'applist_row_item.dart';

class AppointListItem extends StatelessWidget {
  AppointmentList appDetails;

  AppointListItem(this.appDetails, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fromTime = Utility.stringDateConverter(appDetails.fromTime, "hh:mm a");
    String toTime = Utility.stringDateConverter(appDetails.toTime, "hh:mm a");
    ;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      color: CustomColors.greyLight,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                Utility.stringDateConverter(appDetails.fromTime, "dd MMMM yyyy"),
                textAlign: TextAlign.center,
              ),
            ),
            UtilityWidgets.verticalSpace(10),
            RowItems(Icons.watch_later_outlined, "$fromTime to $toTime"),
            UtilityWidgets.verticalSpace(10),
            RowItems(Icons.person, "${appDetails.userName} ( ${appDetails.title} )"),
            UtilityWidgets.verticalSpace(10),
            RowItems(Icons.sticky_note_2, "${appDetails.description} "),
          ],
        ),
      ),
    );
  }
}
