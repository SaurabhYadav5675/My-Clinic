import 'package:flutter/material.dart';
import 'package:my_clinic/Constants/custom_colors.dart';
import 'package:my_clinic/Models/home_screen_model.dart';
import 'package:my_clinic/Providers/home_provider.dart';
import 'package:my_clinic/Utilities/Utility.dart';
import 'package:my_clinic/Widgets/page_loader.dart';
import 'package:my_clinic/Widgets/profile_header_item.dart';
import 'package:my_clinic/Widgets/utility_widgets.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  UserDetails _userDetails = UserDetails();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<UserDetails> getUserDetails() async {
    UserDetails userData = Provider.of<HomeScreenProvider>(context, listen: false).fetchUserDetails;
    if (userData != null) {
      _userDetails = userData;
    }
    return _userDetails;
  }

  @override
  Widget build(BuildContext context) {
    String name = _userDetails.name.toString();
    String email = _userDetails.email.toString();

    return Scaffold(
        appBar: null,
        body: FutureBuilder<UserDetails>(
          future: getUserDetails(),
          builder: (context, snapData) {
            if (snapData.connectionState == ConnectionState.waiting) {
              return const PageLoader();
            } else if (snapData.error != null) {
              Utility.ToastMessage("error in data ");
              return Container();
            } else {
              return Container(
                child: Column(children: [
                  ProfileHeaderItem(snapData.data!.name.toString(), snapData.data!.email.toString()),
                  UtilityWidgets.verticalSpace(10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          "Clinic Id : ",
                          style: UtilityWidgets.textFieldStyle(16.0, CustomColors.black),
                        ),
                        UtilityWidgets.horizontalSpace(10),
                        Text(snapData.data!.clinicId.toString(),
                            style: UtilityWidgets.textFieldStyleBold(16.0, CustomColors.black)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          "Clinic Name : ",
                          style: UtilityWidgets.textFieldStyle(16.0, CustomColors.black),
                        ),
                        UtilityWidgets.horizontalSpace(10),
                        Text(snapData.data!.clinicName.toString(),
                            style: UtilityWidgets.textFieldStyleBold(16.0, CustomColors.black)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          "Contact : ",
                          style: UtilityWidgets.textFieldStyle(16.0, CustomColors.black),
                        ),
                        UtilityWidgets.horizontalSpace(10),
                        Text(snapData.data!.contact.toString(),
                            style: UtilityWidgets.textFieldStyleBold(16.0, CustomColors.black)),
                      ],
                    ),
                  ),
                ]),
              );
            }
          },
        ));
  }
}
