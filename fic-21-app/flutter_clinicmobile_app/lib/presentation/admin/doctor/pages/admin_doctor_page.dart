import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clinicmobile_app/core/extensions/build_context_ext.dart';
import '../../../../core/assets/assets.gen.dart';
import '../../../../core/components/spaces.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/card_doctor_widget.dart';
import 'add_doctor_page.dart';


class AdminDoctorPage extends StatefulWidget {
  const AdminDoctorPage({super.key});

  @override
  State<AdminDoctorPage> createState() => _AdminDoctorPageState();
}

class _AdminDoctorPageState extends State<AdminDoctorPage> {
  List<Map<String, dynamic>> doctors = [
    {
      'image': Assets.images.doctor1.path,
      'name': 'dr. Kiara Tasbiha',
      'specialist': 'Spesialis kandungan',
      'clinic': 'Klinik Sehat Prima',
      'time': '11:00 - 12:00 WIB',
      'price': 'Rp. 40.000',
      'isActive': false
    },
    {
      'image': Assets.images.doctor3.path,
      'name': 'dr. Rini Sekartini',
      'specialist': 'Spesialis kesehatan umum anak',
      'clinic': 'Klinik Sahabat Keluarga',
      'time': '11:00 - 12:00 WIB',
      'price': 'Rp. 35.000',
      'isActive': true
    },
    {
      'image': Assets.images.doctor2.path,
      'name': 'dr. Soedjatmiko, Sp.A(K)',
      'specialist': 'Spesialisasi dalam pediatri',
      'clinic': 'Klinik Citra Harapan',
      'time': '11:00 - 12:00 WIB',
      'price': 'Rp. 40.000',
      'isActive': true
    },
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  const Text(
                    "Kelola Doctor",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push(const AddDoctorPage());
                    },
                    child: const Icon(
                      Icons.add,
                      size: 24.0,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SpaceHeight(14),
            ListView.separated(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: doctors.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SpaceHeight(10);
              },
              itemBuilder: (BuildContext context, int index) {
                return CardDoctorWidget(
                  image: doctors[index]['image'],
                  name: doctors[index]['name'],
                  spesialis: doctors[index]['specialist'],
                  clinic: doctors[index]['clinic'],
                  time: doctors[index]['time'],
                  price: doctors[index]['price'],
                  isActive: doctors[index]['isActive'],
                );
              },
            ),
            // Padding(
            //   padding: EdgeInsets.only(
            //       top: context.deviceHeight * 0.2, left: 20, right: 20),
            //   child: const EmptyDoctorWidget(),
            // ),
          ],
        ),
      ),
    );
  }
}
