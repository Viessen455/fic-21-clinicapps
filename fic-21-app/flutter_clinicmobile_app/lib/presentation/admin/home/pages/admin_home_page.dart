import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clinicmobile_app/core/extensions/build_context_ext.dart';
import '../../../../core/assets/assets.gen.dart';
import '../../../../core/components/spaces.dart';
import '../../../../core/constants/colors.dart';
import '../../../doctor/history/widgets/card_doctor_history.dart';


class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final List<Map<String, dynamic>> histories = [
    {
      "type": "Telemedis",
      "name": "Sintia",
      "doctor": "dr Kiara Tasbiha",
      "price": "Rp. 19.000",
      "date": "24 Nov 2024",
      "id": "123456789125411",
      "time": "05:15 WIB"
    },
    {
      "type": "Chat Premium",
      "name": "Bahri",
      "doctor": "dr Kiara Tasbiha",
      "price": "Rp. 19.000",
      "date": "24 Nov 2024",
      "id": "123456789125411",
      "time": "09:15 WIB"
    },
    {
      "type": "Chat Premium",
      "name": "Fahiem",
      "doctor": "dr Kiara Tasbiha",
      "price": "Rp. 19.000",
      "date": "24 Nov 2024",
      "id": "123456789125411",
      "time": "11:15 WIB"
    },
    {
      "type": "Telemedis",
      "name": "Rohman",
      "doctor": "dr Kiara Tasbiha",
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
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 120,
                width: context.deviceWidth,
                padding: const EdgeInsets.all(20.0),
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Assets.images.logoHorizontal.path,
                          width: 104.0,
                          height: 22.0,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          Assets.images.klinik.path,
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SpaceHeight(
                136,
              ),
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
                    doctor: histories[index]["doctor"],
                    price: histories[index]["price"],
                    date: histories[index]["date"],
                    id: histories[index]["id"],
                    time: histories[index]["time"],
                  );
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 80.0,
              left: 20.0,
              right: 20.0,
            ),
            width: context.deviceWidth,
            height: 153,
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  AppColors.secondary,
                  Color(0xff1469F0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Klinik Sehat prima",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white),
                ),
                Text(
                  "Total  Order : 60",
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Pasien",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          "30",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Dokter",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          "20",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
