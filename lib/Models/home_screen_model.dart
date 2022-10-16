/// user_details : {"clinic_id":["1"],"role_id":["1"],"clinic_name":["Vivek Hosptial"],"login_id":"1","name":"Vivek","email":"viveknadar97@gmail.com","contact":"7715930950"}
/// appointment_list : [{"appointment_id":"1","title":"Headache","description":"Need body checkup","from_time":"2022-06-22 22:35:13","to_time":"2022-06-22 23:35:13","doctor_id":"1","doctor_name":"Vivek","doctor_email":"viveknadar97@gmail.com","clinic_id":"1","clinic_name":"Vivek Hospital","user_id":"2","user_name":"Vivek","user_email":"viveknadar97@test.com","status":"2","file_name":"","fee_amount":"","created_on":"2022-06-22 22:35:13"},{"appointment_id":"2","title":"Skin Care","description":"Body Checkup","from_time":"2022-06-22 23:15:13","to_time":"2022-06-22 23:15:13","doctor_id":"1","doctor_name":"Vivek","doctor_email":"viveknadar97@gmail.com","clinic_id":"1","clinic_name":"Vivek Hosptial","user_id":"2","user_name":"Vivek","user_email":"viveknadar97@test.com","status":"1","file_name":"vivek_appointment_2.pdf","fee_amount":"","created_on":"2022-06-22 23:12:59"},{"appointment_id":"3","title":"Skin Infection","description":"Need to get checked","from_time":"2022-06-22 23:15:13","to_time":"2022-06-22 23:25:13","doctor_id":"1","doctor_name":"Vivek","doctor_email":"viveknadar97@gmail.com","clinic_id":"1","clinic_name":"Vivek Hosptial","user_id":"2","user_name":"Vivek","user_email":"viveknadar97@test.com","status":"0","file_name":"","fee_amount":"","created_on":"2022-06-22 23:15:07"}]
/// clinic_list : [{"clinic_id":"1","clinic_name":"Vivek Hosptial"}]
/// client_list : [{"login_id":"2","name":"Vivek","appointment_list":[{"appointment_id":"1","title":"Headache","description":"Need body checkup","from_time":"2022-06-22 22:35:13","to_time":"2022-06-22 23:35:13","doctor_id":"1","doctor_name":"Vivek","doctor_email":"viveknadar97@gmail.com","clinic_id":"1","clinic_name":"Vivek Hospital","user_id":"2","user_name":"Vivek","user_email":"viveknadar97@test.com","status":"2","file_name":"","fee_amount":"","created_on":"2022-06-22 22:35:13"},{"appointment_id":"2","title":"Skin Care","description":"Body Checkup","from_time":"2022-06-22 23:15:13","to_time":"2022-06-22 23:15:13","doctor_id":"1","doctor_name":"Vivek","doctor_email":"viveknadar97@gmail.com","clinic_id":"1","clinic_name":"Vivek Hosptial","user_id":"2","user_name":"Vivek","user_email":"viveknadar97@test.com","status":"1","file_name":"vivek_appointment_2.pdf","fee_amount":"","created_on":"2022-06-22 23:12:59"},{"appointment_id":"3","title":"Skin Infection","description":"Need to get checked","from_time":"2022-06-22 23:15:13","to_time":"2022-06-22 23:25:13","doctor_id":"1","doctor_name":"Vivek","doctor_email":"viveknadar97@gmail.com","clinic_id":"1","clinic_name":"Vivek Hosptial","user_id":"2","user_name":"Vivek","user_email":"viveknadar97@test.com","status":"0","file_name":"","fee_amount":"","created_on":"2022-06-22 23:15:07"}]}]

class HomeScreenModel {
  HomeScreenModel({
    UserDetails? userDetails,
    List<AppointmentList>? appointmentList,
    List<ClinicList>? clinicList,
    List<ClientList>? clientList,
  }) {
    _userDetails = userDetails;
    _appointmentList = appointmentList;
    _clinicList = clinicList;
    _clientList = clientList;
  }

  HomeScreenModel.fromJson(dynamic json) {
    _userDetails = json['user_details'] != null ? UserDetails.fromJson(json['user_details']) : null;
    if (json['appointment_list'] != null) {
      _appointmentList = [];
      json['appointment_list'].forEach((v) {
        _appointmentList?.add(AppointmentList.fromJson(v));
      });
    }
    if (json['clinic_list'] != null) {
      _clinicList = [];
      json['clinic_list'].forEach((v) {
        _clinicList?.add(ClinicList.fromJson(v));
      });
    }
    if (json['client_list'] != null) {
      _clientList = [];
      json['client_list'].forEach((v) {
        _clientList?.add(ClientList.fromJson(v));
      });
    }
  }

  UserDetails? _userDetails;
  List<AppointmentList>? _appointmentList;
  List<ClinicList>? _clinicList;
  List<ClientList>? _clientList;

  HomeScreenModel copyWith({
    UserDetails? userDetails,
    List<AppointmentList>? appointmentList,
    List<ClinicList>? clinicList,
    List<ClientList>? clientList,
  }) =>
      HomeScreenModel(
        userDetails: userDetails ?? _userDetails,
        appointmentList: appointmentList ?? _appointmentList,
        clinicList: clinicList ?? _clinicList,
        clientList: clientList ?? _clientList,
      );

  UserDetails? get userDetails => _userDetails;

  List<AppointmentList>? get appointmentList => _appointmentList;

  List<ClinicList>? get clinicList => _clinicList;

  List<ClientList>? get clientList => _clientList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_userDetails != null) {
      map['user_details'] = _userDetails?.toJson();
    }
    if (_appointmentList != null) {
      map['appointment_list'] = _appointmentList?.map((v) => v.toJson()).toList();
    }
    if (_clinicList != null) {
      map['clinic_list'] = _clinicList?.map((v) => v.toJson()).toList();
    }
    if (_clientList != null) {
      map['client_list'] = _clientList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// login_id : "2"
/// name : "Vivek"
/// appointment_list : [{"appointment_id":"1","title":"Headache","description":"Need body checkup","from_time":"2022-06-22 22:35:13","to_time":"2022-06-22 23:35:13","doctor_id":"1","doctor_name":"Vivek","doctor_email":"viveknadar97@gmail.com","clinic_id":"1","clinic_name":"Vivek Hospital","user_id":"2","user_name":"Vivek","user_email":"viveknadar97@test.com","status":"2","file_name":"","fee_amount":"","created_on":"2022-06-22 22:35:13"},{"appointment_id":"2","title":"Skin Care","description":"Body Checkup","from_time":"2022-06-22 23:15:13","to_time":"2022-06-22 23:15:13","doctor_id":"1","doctor_name":"Vivek","doctor_email":"viveknadar97@gmail.com","clinic_id":"1","clinic_name":"Vivek Hosptial","user_id":"2","user_name":"Vivek","user_email":"viveknadar97@test.com","status":"1","file_name":"vivek_appointment_2.pdf","fee_amount":"","created_on":"2022-06-22 23:12:59"},{"appointment_id":"3","title":"Skin Infection","description":"Need to get checked","from_time":"2022-06-22 23:15:13","to_time":"2022-06-22 23:25:13","doctor_id":"1","doctor_name":"Vivek","doctor_email":"viveknadar97@gmail.com","clinic_id":"1","clinic_name":"Vivek Hosptial","user_id":"2","user_name":"Vivek","user_email":"viveknadar97@test.com","status":"0","file_name":"","fee_amount":"","created_on":"2022-06-22 23:15:07"}]

class ClientList {
  ClientList({
    String? loginId,
    String? name,
    List<ClientAppointmentList>? appointmentList,
  }) {
    _loginId = loginId;
    _name = name;
    _appointmentList = appointmentList;
  }

  ClientList.fromJson(dynamic json) {
    _loginId = json['login_id'];
    _name = json['name'];
    if (json['appointment_list'] != null) {
      _appointmentList = [];
      json['appointment_list'].forEach((v) {
        _appointmentList?.add(ClientAppointmentList.fromJson(v));
      });
    }
  }

  String? _loginId;
  String? _name;
  List<ClientAppointmentList>? _appointmentList;

  ClientList copyWith({
    String? loginId,
    String? name,
    List<ClientAppointmentList>? appointmentList,
  }) =>
      ClientList(
        loginId: loginId ?? _loginId,
        name: name ?? _name,
        appointmentList: appointmentList ?? _appointmentList,
      );

  String? get loginId => _loginId;

  String? get name => _name;

  List<ClientAppointmentList>? get appointmentList => _appointmentList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login_id'] = _loginId;
    map['name'] = _name;
    if (_appointmentList != null) {
      map['appointment_list'] = _appointmentList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// appointment_id : "1"
/// title : "Headache"
/// description : "Need body checkup"
/// from_time : "2022-06-22 22:35:13"
/// to_time : "2022-06-22 23:35:13"
/// doctor_id : "1"
/// doctor_name : "Vivek"
/// doctor_email : "viveknadar97@gmail.com"
/// clinic_id : "1"
/// clinic_name : "Vivek Hospital"
/// user_id : "2"
/// user_name : "Vivek"
/// user_email : "viveknadar97@test.com"
/// status : "2"
/// file_name : ""
/// fee_amount : ""
/// created_on : "2022-06-22 22:35:13"

class ClientAppointmentList {
  AppointmentList({
    String? appointmentId,
    String? title,
    String? description,
    String? fromTime,
    String? toTime,
    String? doctorId,
    String? doctorName,
    String? doctorEmail,
    String? clinicId,
    String? clinicName,
    String? userId,
    String? userName,
    String? userEmail,
    String? status,
    String? fileName,
    String? feeAmount,
    String? createdOn,
  }) {
    _appointmentId = appointmentId;
    _title = title;
    _description = description;
    _fromTime = fromTime;
    _toTime = toTime;
    _doctorId = doctorId;
    _doctorName = doctorName;
    _doctorEmail = doctorEmail;
    _clinicId = clinicId;
    _clinicName = clinicName;
    _userId = userId;
    _userName = userName;
    _userEmail = userEmail;
    _status = status;
    _fileName = fileName;
    _feeAmount = feeAmount;
    _createdOn = createdOn;
  }

  ClientAppointmentList.fromJson(dynamic json) {
    _appointmentId = json['appointment_id'];
    _title = json['title'];
    _description = json['description'];
    _fromTime = json['from_time'];
    _toTime = json['to_time'];
    _doctorId = json['doctor_id'];
    _doctorName = json['doctor_name'];
    _doctorEmail = json['doctor_email'];
    _clinicId = json['clinic_id'];
    _clinicName = json['clinic_name'];
    _userId = json['user_id'];
    _userName = json['user_name'];
    _userEmail = json['user_email'];
    _status = json['status'];
    _fileName = json['file_name'];
    _feeAmount = json['fee_amount'];
    _createdOn = json['created_on'];
  }

  String? _appointmentId;
  String? _title;
  String? _description;
  String? _fromTime;
  String? _toTime;
  String? _doctorId;
  String? _doctorName;
  String? _doctorEmail;
  String? _clinicId;
  String? _clinicName;
  String? _userId;
  String? _userName;
  String? _userEmail;
  String? _status;
  String? _fileName;
  String? _feeAmount;
  String? _createdOn;

  ClientAppointmentList copyWith({
    String? appointmentId,
    String? title,
    String? description,
    String? fromTime,
    String? toTime,
    String? doctorId,
    String? doctorName,
    String? doctorEmail,
    String? clinicId,
    String? clinicName,
    String? userId,
    String? userName,
    String? userEmail,
    String? status,
    String? fileName,
    String? feeAmount,
    String? createdOn,
  }) =>
      AppointmentList(
        appointmentId: appointmentId ?? _appointmentId,
        title: title ?? _title,
        description: description ?? _description,
        fromTime: fromTime ?? _fromTime,
        toTime: toTime ?? _toTime,
        doctorId: doctorId ?? _doctorId,
        doctorName: doctorName ?? _doctorName,
        doctorEmail: doctorEmail ?? _doctorEmail,
        clinicId: clinicId ?? _clinicId,
        clinicName: clinicName ?? _clinicName,
        userId: userId ?? _userId,
        userName: userName ?? _userName,
        userEmail: userEmail ?? _userEmail,
        status: status ?? _status,
        fileName: fileName ?? _fileName,
        feeAmount: feeAmount ?? _feeAmount,
        createdOn: createdOn ?? _createdOn,
      );

  String? get appointmentId => _appointmentId;

  String? get title => _title;

  String? get description => _description;

  String? get fromTime => _fromTime;

  String? get toTime => _toTime;

  String? get doctorId => _doctorId;

  String? get doctorName => _doctorName;

  String? get doctorEmail => _doctorEmail;

  String? get clinicId => _clinicId;

  String? get clinicName => _clinicName;

  String? get userId => _userId;

  String? get userName => _userName;

  String? get userEmail => _userEmail;

  String? get status => _status;

  String? get fileName => _fileName;

  String? get feeAmount => _feeAmount;

  String? get createdOn => _createdOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appointment_id'] = _appointmentId;
    map['title'] = _title;
    map['description'] = _description;
    map['from_time'] = _fromTime;
    map['to_time'] = _toTime;
    map['doctor_id'] = _doctorId;
    map['doctor_name'] = _doctorName;
    map['doctor_email'] = _doctorEmail;
    map['clinic_id'] = _clinicId;
    map['clinic_name'] = _clinicName;
    map['user_id'] = _userId;
    map['user_name'] = _userName;
    map['user_email'] = _userEmail;
    map['status'] = _status;
    map['file_name'] = _fileName;
    map['fee_amount'] = _feeAmount;
    map['created_on'] = _createdOn;
    return map;
  }
}

/// clinic_id : "1"
/// clinic_name : "Vivek Hosptial"

class ClinicList {
  ClinicList({
    String? clinicId,
    String? clinicName,
  }) {
    _clinicId = clinicId;
    _clinicName = clinicName;
  }

  ClinicList.fromJson(dynamic json) {
    _clinicId = json['clinic_id'];
    _clinicName = json['clinic_name'];
  }

  String? _clinicId;
  String? _clinicName;

  ClinicList copyWith({
    String? clinicId,
    String? clinicName,
  }) =>
      ClinicList(
        clinicId: clinicId ?? _clinicId,
        clinicName: clinicName ?? _clinicName,
      );

  String? get clinicId => _clinicId;

  String? get clinicName => _clinicName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['clinic_id'] = _clinicId;
    map['clinic_name'] = _clinicName;
    return map;
  }
}

class AppointmentList {
  AppointmentList({
    String? appointmentId,
    String? title,
    String? description,
    String? fromTime,
    String? toTime,
    String? doctorId,
    String? doctorName,
    String? doctorEmail,
    String? clinicId,
    String? clinicName,
    String? userId,
    String? userName,
    String? userEmail,
    String? status,
    String? fileName,
    String? feeAmount,
    String? createdOn,
  }) {
    _appointmentId = appointmentId;
    _title = title;
    _description = description;
    _fromTime = fromTime;
    _toTime = toTime;
    _doctorId = doctorId;
    _doctorName = doctorName;
    _doctorEmail = doctorEmail;
    _clinicId = clinicId;
    _clinicName = clinicName;
    _userId = userId;
    _userName = userName;
    _userEmail = userEmail;
    _status = status;
    _fileName = fileName;
    _feeAmount = feeAmount;
    _createdOn = createdOn;
  }

  AppointmentList.fromJson(dynamic json) {
    _appointmentId = json['appointment_id'];
    _title = json['title'];
    _description = json['description'];
    _fromTime = json['from_time'];
    _toTime = json['to_time'];
    _doctorId = json['doctor_id'];
    _doctorName = json['doctor_name'];
    _doctorEmail = json['doctor_email'];
    _clinicId = json['clinic_id'];
    _clinicName = json['clinic_name'];
    _userId = json['user_id'];
    _userName = json['user_name'];
    _userEmail = json['user_email'];
    _status = json['status'];
    _fileName = json['file_name'];
    _feeAmount = json['fee_amount'];
    _createdOn = json['created_on'];
  }

  String? _appointmentId;
  String? _title;
  String? _description;
  String? _fromTime;
  String? _toTime;
  String? _doctorId;
  String? _doctorName;
  String? _doctorEmail;
  String? _clinicId;
  String? _clinicName;
  String? _userId;
  String? _userName;
  String? _userEmail;
  String? _status;
  String? _fileName;
  String? _feeAmount;
  String? _createdOn;

  AppointmentList copyWith({
    String? appointmentId,
    String? title,
    String? description,
    String? fromTime,
    String? toTime,
    String? doctorId,
    String? doctorName,
    String? doctorEmail,
    String? clinicId,
    String? clinicName,
    String? userId,
    String? userName,
    String? userEmail,
    String? status,
    String? fileName,
    String? feeAmount,
    String? createdOn,
  }) =>
      AppointmentList(
        appointmentId: appointmentId ?? _appointmentId,
        title: title ?? _title,
        description: description ?? _description,
        fromTime: fromTime ?? _fromTime,
        toTime: toTime ?? _toTime,
        doctorId: doctorId ?? _doctorId,
        doctorName: doctorName ?? _doctorName,
        doctorEmail: doctorEmail ?? _doctorEmail,
        clinicId: clinicId ?? _clinicId,
        clinicName: clinicName ?? _clinicName,
        userId: userId ?? _userId,
        userName: userName ?? _userName,
        userEmail: userEmail ?? _userEmail,
        status: status ?? _status,
        fileName: fileName ?? _fileName,
        feeAmount: feeAmount ?? _feeAmount,
        createdOn: createdOn ?? _createdOn,
      );

  String? get appointmentId => _appointmentId;

  String? get title => _title;

  String? get description => _description;

  String? get fromTime => _fromTime;

  String? get toTime => _toTime;

  String? get doctorId => _doctorId;

  String? get doctorName => _doctorName;

  String? get doctorEmail => _doctorEmail;

  String? get clinicId => _clinicId;

  String? get clinicName => _clinicName;

  String? get userId => _userId;

  String? get userName => _userName;

  String? get userEmail => _userEmail;

  String? get status => _status;

  String? get fileName => _fileName;

  String? get feeAmount => _feeAmount;

  String? get createdOn => _createdOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appointment_id'] = _appointmentId;
    map['title'] = _title;
    map['description'] = _description;
    map['from_time'] = _fromTime;
    map['to_time'] = _toTime;
    map['doctor_id'] = _doctorId;
    map['doctor_name'] = _doctorName;
    map['doctor_email'] = _doctorEmail;
    map['clinic_id'] = _clinicId;
    map['clinic_name'] = _clinicName;
    map['user_id'] = _userId;
    map['user_name'] = _userName;
    map['user_email'] = _userEmail;
    map['status'] = _status;
    map['file_name'] = _fileName;
    map['fee_amount'] = _feeAmount;
    map['created_on'] = _createdOn;
    return map;
  }
}

/// clinic_id : ["1"]
/// role_id : ["1"]
/// clinic_name : ["Vivek Hosptial"]
/// login_id : "1"
/// name : "Vivek"
/// email : "viveknadar97@gmail.com"
/// contact : "7715930950"

class UserDetails {
  UserDetails({
    List<String>? clinicId,
    List<String>? roleId,
    List<String>? clinicName,
    String? loginId,
    String? name,
    String? email,
    String? contact,
  }) {
    _clinicId = clinicId;
    _roleId = roleId;
    _clinicName = clinicName;
    _loginId = loginId;
    _name = name;
    _email = email;
    _contact = contact;
  }

  UserDetails.fromJson(dynamic json) {
    _clinicId = json['clinic_id'] != null ? json['clinic_id'].cast<String>() : [];
    _roleId = json['role_id'] != null ? json['role_id'].cast<String>() : [];
    _clinicName = json['clinic_name'] != null ? json['clinic_name'].cast<String>() : [];
    _loginId = json['login_id'];
    _name = json['name'];
    _email = json['email'];
    _contact = json['contact'];
  }

  List<String>? _clinicId;
  List<String>? _roleId;
  List<String>? _clinicName;
  String? _loginId;
  String? _name;
  String? _email;
  String? _contact;

  UserDetails copyWith({
    List<String>? clinicId,
    List<String>? roleId,
    List<String>? clinicName,
    String? loginId,
    String? name,
    String? email,
    String? contact,
  }) =>
      UserDetails(
        clinicId: clinicId ?? _clinicId,
        roleId: roleId ?? _roleId,
        clinicName: clinicName ?? _clinicName,
        loginId: loginId ?? _loginId,
        name: name ?? _name,
        email: email ?? _email,
        contact: contact ?? _contact,
      );

  List<String>? get clinicId => _clinicId;

  List<String>? get roleId => _roleId;

  List<String>? get clinicName => _clinicName;

  String? get loginId => _loginId;

  String? get name => _name;

  String? get email => _email;

  String? get contact => _contact;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['clinic_id'] = _clinicId;
    map['role_id'] = _roleId;
    map['clinic_name'] = _clinicName;
    map['login_id'] = _loginId;
    map['name'] = _name;
    map['email'] = _email;
    map['contact'] = _contact;
    return map;
  }
}
