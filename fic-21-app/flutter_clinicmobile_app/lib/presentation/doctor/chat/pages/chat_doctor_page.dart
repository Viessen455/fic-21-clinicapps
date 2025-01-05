import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clinicmobile_app/core/assets/assets.gen.dart';
import 'package:flutter_clinicmobile_app/core/components/spaces.dart';
import 'package:flutter_clinicmobile_app/core/constants/colors.dart';
import 'package:flutter_clinicmobile_app/core/extensions/build_context_ext.dart';
import 'package:flutter_clinicmobile_app/presentation/doctor/chat/widgets/card_chat.dart';

class ChatDoctorPage extends StatefulWidget {
  const ChatDoctorPage({super.key});

  @override
  State<ChatDoctorPage> createState() => _ChatDoctorPageState();
}

class _ChatDoctorPageState extends State<ChatDoctorPage> {
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff1469F0),
      statusBarBrightness: Brightness.dark,
    ));
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 80,
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
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          Assets.images.doctor1.path,
                          width: 32.0,
                          height: 32.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SpaceHeight(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                isActive
                    ? menuActive("Aktif", () {
                        setState(() {
                          isActive = true;
                        });
                      })
                    : menuDisable("Aktif", () {
                        setState(() {
                          isActive = true;
                        });
                      }),
                const SpaceWidth(12),
                !isActive
                    ? menuActive("Selesai", () {
                        setState(() {
                          isActive = false;
                        });
                      })
                    : menuDisable("Selesai", () {
                        setState(() {
                          isActive = false;
                        });
                      }),
              ],
            ),
          ),
          ListView.separated(
            padding: const EdgeInsets.all(20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            separatorBuilder: (BuildContext context, int index) {
              return const SpaceHeight(10);
            },
            itemBuilder: (BuildContext context, int index) {
              return CardChat(isActive: isActive);
            },
          ),
        ],
      ),
    );
  }

  Widget menuActive(String title, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 34,
        width: 76,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [
              AppColors.secondary,
              Color(0xff1469F0),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget menuDisable(String title, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 34,
        width: 76,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xffB0BEC3),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: Color(0xffB0BEC3),
            ),
          ),
        ),
      ),
    );
  }
}
