import 'package:flutter/material.dart';
import 'package:my_clinic/Models/home_screen_model.dart';
import 'package:my_clinic/Providers/home_provider.dart';
import 'package:my_clinic/Widgets/page_loader.dart';
import 'package:provider/provider.dart';

import '../Widgets/Appoinments/appoint_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: FutureBuilder(
        future: Provider.of<HomeScreenProvider>(context, listen: false).getHomeModelList(),
        builder: (context, snapData) {
          if (snapData.connectionState == ConnectionState.waiting) {
            return const PageLoader();
          } else {
            return Consumer<HomeScreenProvider>(builder: (context, value, child) {
              List<AppointmentList> appointments = value.fetchAppointment;
              List<ClinicList> clinics = value.fetchClinic;
              List<ClientList> clients = value.fetchClient;
              return SingleChildScrollView(
                  child: Column(
                children: [
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: appointments.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AppointListItem(appointments[index]);
                      })
                ],
              ));
            });
          }
        },
      ),
    );
  }
}
