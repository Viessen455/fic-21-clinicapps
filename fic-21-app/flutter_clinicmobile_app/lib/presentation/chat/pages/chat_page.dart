import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clinicmobile_app/core/assets/assets.gen.dart';
import 'package:flutter_clinicmobile_app/core/components/spaces.dart';
import 'package:flutter_clinicmobile_app/core/constants/colors.dart';
import 'package:flutter_clinicmobile_app/core/extensions/build_context_ext.dart';
import 'package:flutter_clinicmobile_app/presentation/chat/widgets/card_doctor_chat.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Map<String, dynamic>> doctors = [
    {
      'image': Assets.images.doctor1.path,
      'name': 'dr. Kiara Tasbiha',
      'specialist': 'Spesialis kandungan',
      'clinic': 'Klinik Sehat Prima',
      'time': '11:00 - 12:00 WIB',
      'price': 'Rp. 40.000',
    },
    {
      'image': Assets.images.doctor3.path,
      'name': 'dr. Rini Sekartini',
      'specialist': 'Spesialis kesehatan umum anak',
      'clinic': 'Klinik Sahabat Keluarga',
      'time': '11:00 - 12:00 WIB',
      'price': 'Rp. 35.000',
    },
    {
      'image': Assets.images.doctor2.path,
      'name': 'dr. Soedjatmiko, Sp.A(K)',
      'specialist': 'Spesialisasi dalam pediatri',
      'clinic': 'Klinik Citra Harapan',
      'time': '11:00 - 12:00 WIB',
      'price': 'Rp. 40.000',
    },
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
                          Assets.images.doctorCircle.path,
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
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: doctors.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SpaceHeight(10);
                },
                itemBuilder: (BuildContext context, int index) {
                  return CardDoctorChat(
                    image: doctors[index]['image'],
                    name: doctors[index]['name'],
                    spesialis: doctors[index]['specialist'],
                    clinic: doctors[index]['clinic'],
                    time: doctors[index]['time'],
                    price: doctors[index]['price'],
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
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 20,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 55,
                      height: 60,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Image.asset(
                        Assets.icons.hand.path,
                        width: 38.0,
                        height: 34.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SpaceWidth(16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chat Dokter di Ayo Sehat',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Layanan Live Chat yang siap siaga untuk bantu kamu hidup lebih sehat.',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SpaceHeight(8),
                Container(
                  width: context.deviceWidth,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(
                      0xffF5F5F5,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: Color(0xff8C8C8C),
                      ),
                      const SpaceWidth(16),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Cari dokter atau spesialis',
                            hintStyle: TextStyle(
                              color: Color(
                                0xff8C8C8C,
                              ),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SpaceHeight(
                  10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 26,
                        width: 72,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primary.withOpacity(
                            0.2,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Semua',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      const SpaceWidth(16),
                      menu('Anak'),
                      const SpaceWidth(16),
                      menu('Kandungan'),
                      const SpaceWidth(16),
                      menu('Psikiater'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget menu(String title) {
    return Container(
      height: 26,
      width: 72,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffEFF2F1),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Color(0xffA7A6A5),
          ),
        ),
      ),
    );
  }
}
