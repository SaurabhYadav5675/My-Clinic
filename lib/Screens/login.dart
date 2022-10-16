import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:my_clinic/Screens/home_navigation.dart';
import 'package:my_clinic/Screens/registration.dart';
import 'package:my_clinic/Utilities/Utility.dart';
import 'package:my_clinic/Utilities/app_Preference.dart';
import 'package:my_clinic/Utilities/network_api.dart';
import 'package:my_clinic/Widgets/utility_widgets.dart';

import '../DialogBox/title_dailog.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final formKey = GlobalKey<FormState>(); //key for form

  void _closeDailog() {
    Navigator.pop(context);
  }

  Future<void> _formValidation() async {
    if (formKey.currentState!.validate()) {
      final String userName = _userName.text;
      final String password = _password.text;
      Map<String, dynamic> params = {
        "contact": userName,
        "password": password,
      };
      var apiUrl = Uri.parse(NetworkApi.verifyUser);
      final response = await http.post(apiUrl, body: params);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        AppPreference.setToken(data['token']);
        AppPreference.setLoginStatus("yes");
        Utility.ToastMessage("Successfully Login");
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => const HomeNavigation()), (route) => false);
      } else {
        String msg = Utility.getResError(response.body);
        showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return TitleDailog(msg, _closeDailog);
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 25),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Already\nhave an\nAccount?",
                        style: UtilityWidgets.textFieldStyleBold(16.0, Colors.black),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter contact number';
                            }
                            return null;
                          },
                          controller: _userName,
                          style: UtilityWidgets.textFieldStyle(14.0, Colors.black),
                          decoration: UtilityWidgets.textFieldDecoration(
                              "Contact number", "Enter contact number", 20.0, 2.0, Icons.person),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ]),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        controller: _password,
                        style: UtilityWidgets.textFieldStyle(14.0, Colors.black),
                        decoration: UtilityWidgets.textFieldDecoration(
                            "Password", "Enter Password", 20.0, 2.0, Icons.lock_rounded),
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                    onPressed: _formValidation,
                    style: UtilityWidgets.roundCornerBlueOutline(vertical: 10, horizontal: 20),
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Login",
                              style: UtilityWidgets.textFieldStyle(14.0, Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            size: 15,
                            color: Colors.black,
                          )
                        ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Registration()));
                },
                child: SizedBox(
                  height: 40,
                  child: UtilityWidgets.topRoundedButtonDesign("New user? Register Now", 30, 8, 14, Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
