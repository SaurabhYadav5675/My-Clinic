import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../DialogBox/title_dailog.dart';
import '../Utilities/Utility.dart';
import '../Utilities/app_Preference.dart';
import '../Utilities/network_api.dart';
import '../Widgets/utility_widgets.dart';
import 'home_navigation.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _clinicName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>(); //key for form

  Future<void> _registerValidation() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> params = {
        "name": _fullName.text,
        "email": _email.text,
        "contact": _contact.text,
        "password": _password.text,
        "clinic_name": _clinicName.text,
      };
      var apiUrl = Uri.parse(NetworkApi.registerProfile);
      final response = await http.post(apiUrl, body: params);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        AppPreference.setToken(data['token']);
        AppPreference.setLoginStatus("yes");
        Utility.ToastMessage("User Registered Successfully");
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

  void _closeDailog() {
    Navigator.pop(context);
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
                padding: const EdgeInsets.only(top: 50, left: 25),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "New user\nRegister here",
                        style: UtilityWidgets.textFieldStyleBold(16.0, Colors.black),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Form(
                    key: _formKey,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .5,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter Full name';
                                }
                                return null;
                              },
                              controller: _fullName,
                              style: UtilityWidgets.textFieldStyle(14.0, Colors.black),
                              decoration: UtilityWidgets.textFieldDecoration(
                                  "Full name", "Enter Your Full name", 20.0, 2.0, Icons.person),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter Email';
                                }
                                return null;
                              },
                              controller: _email,
                              style: UtilityWidgets.textFieldStyle(14.0, Colors.black),
                              decoration:
                                  UtilityWidgets.textFieldDecoration("Email", "Enter a Email", 20.0, 2.0, Icons.email),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter contact';
                                }
                                return null;
                              },
                              controller: _contact,
                              style: UtilityWidgets.textFieldStyle(14.0, Colors.black),
                              decoration: UtilityWidgets.textFieldDecoration(
                                  "Contact", "Enter contact", 20.0, 2.0, Icons.phone_android),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter clinic name';
                                }
                                return null;
                              },
                              controller: _clinicName,
                              style: UtilityWidgets.textFieldStyle(14.0, Colors.black),
                              decoration: UtilityWidgets.textFieldDecoration(
                                  "Clinic name", "Enter clinic name", 20.0, 2.0, Icons.local_hospital),
                            ),
                            const SizedBox(
                              height: 20,
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
                              obscureText: true,
                              decoration: UtilityWidgets.textFieldDecoration(
                                  "Password", "Enter Password", 20.0, 2.0, Icons.lock_rounded),
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter Confirm Password';
                                } else if (value != _password.text) {
                                  return 'Password must be same as above';
                                }
                                return null;
                              },
                              controller: _confirmPassword,
                              style: UtilityWidgets.textFieldStyle(14.0, Colors.black),
                              decoration: UtilityWidgets.textFieldDecoration(
                                  "Confirm Password", "Enter Confirm Password", 20.0, 2.0, Icons.lock_rounded),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: _registerValidation,
                              style: UtilityWidgets.roundCornerBlueOutline(vertical: 10, horizontal: 20),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Sign Up",
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: UtilityWidgets.topRoundedButtonDesign("Already have account? Login", 30, 8, 14, Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
