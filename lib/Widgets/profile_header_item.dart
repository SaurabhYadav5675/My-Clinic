import 'package:flutter/material.dart';
import 'package:my_clinic/Providers/home_provider.dart';
import 'package:my_clinic/Widgets/utility_widgets.dart';
import 'package:provider/provider.dart';

import '../Constants/custom_colors.dart';

class ProfileHeaderItem extends StatefulWidget {
  String name;
  String email;

  ProfileHeaderItem(this.name, this.email, {Key? key}) : super(key: key);

  @override
  State<ProfileHeaderItem> createState() => _ProfileHeaderItemState();
}

class _ProfileHeaderItemState extends State<ProfileHeaderItem> {
  bool isShowCollege = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: CustomColors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: FutureBuilder(
            future: Provider.of<HomeScreenProvider>(context, listen: false).getHomeModelList(),
            builder: (context, snapData) {
              return Consumer<HomeScreenProvider>(builder: (context, value, child) {
                final userDetails = value.fetchUserDetails;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        verticalDirection: VerticalDirection.down,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                null;
                              },
                              child: UtilityWidgets.circularImageUrl(70, 70,
                                  "https://dpwhatsapp.xyz/wp-content/uploads/2021/05/Anonymous-WhatsApp-DP.jpg"),
                            ),
                          ),
                          UtilityWidgets.horizontalSpace(15),
                          Expanded(
                            flex: 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.name.toString(),
                                    textAlign: TextAlign.left,
                                    style: UtilityWidgets.textFieldStyle(18.0, CustomColors.black)),
                                Padding(
                                    padding: const EdgeInsets.only(
                                      top: 6,
                                    ),
                                    child: Text(
                                      widget.email.toString(),
                                      textAlign: TextAlign.left,
                                      style: UtilityWidgets.textFieldStyle(16.0, CustomColors.black),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              });
            },
          ),
        ));
  }
}
