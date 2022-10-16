import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:my_clinic/Models/home_screen_model.dart';

import '../Utilities/Utility.dart';
import '../Utilities/app_Preference.dart';
import '../Utilities/network_api.dart';

class HomeScreenProvider with ChangeNotifier {
  late HomeScreenModel _homeModelList;

  UserDetails _userDetails = UserDetails();
  List<AppointmentList> _appointmentList = [];
  List<ClinicList> _clinicList = [];
  List<ClientList> _clientList = [];

  HomeScreenModel get fetchHomeModel {
    return _homeModelList;
  }

  UserDetails get fetchUserDetails {
    if (_homeModelList.userDetails != null) {
      _userDetails = _homeModelList.userDetails!;
    } else {
      _userDetails = UserDetails();
    }
    return _userDetails;
  }

  List<AppointmentList> get fetchAppointment {
    _appointmentList.clear();
    _appointmentList = _homeModelList.appointmentList!;
    return [..._appointmentList];
  }

  List<ClinicList> get fetchClinic {
    _clinicList.clear();
    _clinicList = _homeModelList.clinicList!;
    return [..._clinicList];
  }

  List<ClientList> get fetchClient {
    _clientList.clear();
    _clientList = _homeModelList.clientList!;
    return [..._clientList];
  }

  Future<void> getHomeModelList() async {
    var apiUrl = Uri.parse(NetworkApi.getData);
    try {
      final response = await http.post(apiUrl, headers: {"Authorization": AppPreference.getToken()});
      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        _homeModelList = HomeScreenModel.fromJson(userData);
        notifyListeners();
      } else {
        Utility.ToastMessage(Utility.getResError(response.body));
        throw (Error);
      }
    } catch (error) {
      rethrow;
    }
  }
}
