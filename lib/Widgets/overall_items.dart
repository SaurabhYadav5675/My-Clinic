import 'package:flutter/material.dart';
import 'package:my_clinic/Models/home_screen_model.dart';

import '../Constants/custom_colors.dart';

class OverallAttendanceItem extends StatelessWidget {
  AppointmentList appDetails;

  OverallAttendanceItem(this.appDetails, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: ListTile(
            minLeadingWidth: 12,
            leading: Icon(
              Icons.circle,
              size: 12,
              color: CustomColors.colorBlue,
            ),
            title: Text(appDetails.description ?? ""),
            trailing: Text(
              appDetails.clinicName ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
