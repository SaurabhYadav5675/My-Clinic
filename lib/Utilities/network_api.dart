class NetworkApi {
  static String baseUrl = "http://192.168.0.193/clinic_management/api/login/";

  //static String baseUrl = "http://192.168.0.193/clinic_management/api/login/";

  static String registerProfile = baseUrl + "register_profile";
  static String registerClient = baseUrl + "register_client";

  static String verifyUser = baseUrl + "verify_user";
  static String checkProfile = baseUrl + "check_profile";
  static String editProfile = baseUrl + "edit_profile";

  static String getData = baseUrl + "get_data";

  static String createAppointment = baseUrl + "create_appointment";
  static String deleteAppointment = baseUrl + "delete_appointment";
  static String updateAppointment = baseUrl + "update_appointment";
  static String appointmentClose = baseUrl + "appointment_close";
}
