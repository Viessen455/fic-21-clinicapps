import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clinicmobile_app/core/components/spaces.dart';
import 'package:flutter_clinicmobile_app/core/constants/colors.dart';
import 'package:flutter_clinicmobile_app/core/extensions/build_context_ext.dart';
import 'package:flutter_clinicmobile_app/presentation/doctor/history/widgets/card_doctor_history.dart';

class HistoryDoctorPage extends StatelessWidget {
  HistoryDoctorPage({super.key});

  final List<Map<String, dynamic>> histories = [
    {
      "type": "Telemedis",
      "name": "Sintia",
      "price": "Rp. 19.000",
      "date": "24 Nov 2024",
      "id": "123456789125411",
      "time": "05:15 WIB"
    },
    {
      "type": "Chat Premium",
      "name": "Bahri",
      "price": "Rp. 19.000",
      "date": "24 Nov 2024",
      "id": "123456789125411",
      "time": "09:15 WIB"
    },
    {
      "type": "Chat Premium",
      "name": "Fahiem",
      "price": "Rp. 19.000",
      "date": "24 Nov 2024",
      "id": "123456789125411",
      "time": "11:15 WIB"
    },
    {
      "type": "Telemedis",
      "name": "Rohman",
      "price": "Rp. 19.000",
      "date": "24 Nov 2024",
      "id": "123456789125411",
      "time": "10:15 WIB"
    }
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff1469F0),
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: context.deviceWidth,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.secondary,
                    Color(0xff1469F0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: const Center(
                child: Text(
                  "History",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            const SpaceHeight(14),
            ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: histories.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SpaceHeight(12);
              },
              itemBuilder: (BuildContext context, int index) {
                return CardDoctorHistory(
                  type: histories[index]["type"],
                  name: histories[index]["name"],
                  price: histories[index]["price"],
                  date: histories[index]["date"],
                  id: histories[index]["id"],
                  time: histories[index]["time"],
                );
              },
            ),
            // Padding(
            //   padding: EdgeInsets.only(
            //       top: context.deviceHeight * 0.2, left: 20, right: 20),
            //   child: const EmptyWidget(),
            // ),
          ],
        ),
      ),
    );
  }
}
