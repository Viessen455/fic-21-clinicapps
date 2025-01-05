import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clinicmobile_app/core/extensions/build_context_ext.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/components/custom_text_field.dart';
import '../../../../core/components/custom_text_field_height.dart';
import '../../../../core/components/spaces.dart';
import '../../../../core/constants/colors.dart';

class AddDoctorPage extends StatefulWidget {
  const AddDoctorPage({super.key});

  @override
  State<AddDoctorPage> createState() => _AddDoctorPageState();
}

class _AddDoctorPageState extends State<AddDoctorPage> {
  String? _selectedGender;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff1469F0),
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      bottomNavigationBar: Container(
        height: 52,
        margin: const EdgeInsets.all(20),
        width: context.deviceWidth,
        child: Button.filled(
          height: 48,
          onPressed: () {},
          label: 'Simpan',
          fontSize: 16.0,
        ),
      ),
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
                children: [
                  IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                      )),
                  SpaceWidth(context.deviceWidth * 0.2),
                  const Text(
                    "Tambah Doctor",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SpaceHeight(24),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              width: context.deviceWidth,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 24,
                    offset: Offset(0, 11),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Nama Dokter",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SpaceHeight(
                    8,
                  ),
                  CustomTextField(
                    controller: TextEditingController(),
                    label: 'Masukkan nama Dokter',
                    textInputAction: TextInputAction.next,
                  ),
                  const SpaceHeight(
                    16,
                  ),
                  const Text(
                    "Sertifikasi",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SpaceHeight(
                    8,
                  ),
                  CustomTextFieldHeight(
                    controller: TextEditingController(),
                    label: 'Masukkan Sertifikasi',
                  ),
                  const SpaceHeight(
                    16,
                  ),
                  const Text(
                    "Jenis Kelamin",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SpaceHeight(
                    8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Pria',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                            activeColor: Colors.blue,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedGender = 'Pria';
                              });
                            },
                            child: const Text(
                              'Pria',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color(
                                  0xff677294,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SpaceWidth(28),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Wanita',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                            activeColor: AppColors.primary,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedGender = 'Wanita';
                              });
                            },
                            child: const Text(
                              'Wanita',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color(
                                  0xff677294,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SpaceHeight(
                    16,
                  ),
                  const Text(
                    "Spesialisasi",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SpaceHeight(
                    8,
                  ),
                  CustomTextField(
                    controller: TextEditingController(),
                    label: 'Masukkan Spesialis',
                    keyboardType: TextInputType.number,
                  ),
                  const SpaceHeight(
                    16,
                  ),
                  const Text(
                    "Tarif Telemedis",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SpaceHeight(
                    8,
                  ),
                  CustomTextField(
                    controller: TextEditingController(),
                    label: 'Masukkan tarif telemedis ',
                    keyboardType: TextInputType.number,
                  ),
                  const SpaceHeight(
                    16,
                  ),
                  const Text(
                    "Tarif Chat Premium",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SpaceHeight(
                    8,
                  ),
                  CustomTextField(
                    controller: TextEditingController(),
                    label: 'Masukkan tarif chat premium',
                    keyboardType: TextInputType.number,
                  ),
                  const SpaceHeight(
                    16,
                  ),
                  const Text(
                    "Jadwal Praktik",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SpaceHeight(
                    8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.grey),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.schedule,
                              size: 24.0,
                              color: AppColors.grey,
                            ),
                            SpaceWidth(6),
                            Text(
                              "Mulai",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.grey),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.schedule,
                              size: 24.0,
                              color: AppColors.grey,
                            ),
                            SpaceWidth(6),
                            Text(
                              "Selesai",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SpaceHeight(24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
