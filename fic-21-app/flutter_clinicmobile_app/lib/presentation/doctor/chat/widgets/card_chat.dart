// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_clinicmobile_app/core/assets/assets.gen.dart';
import 'package:flutter_clinicmobile_app/core/components/spaces.dart';
import 'package:flutter_clinicmobile_app/core/constants/colors.dart';
import 'package:flutter_clinicmobile_app/core/extensions/build_context_ext.dart';
import 'package:flutter_clinicmobile_app/presentation/doctor/chat/pages/room_chat_doctor_page.dart';

class CardChat extends StatelessWidget {
  final bool isActive;
  const CardChat({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(const RoomChatDoctorPage());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        width: context.deviceWidth,
        decoration: BoxDecoration(
          color: const Color(
            0xffF5F5F5,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "9:12",
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: Color(
                  0xffA7A6A5,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      Assets.images.doctorVidcall2.path,
                      width: 36.0,
                      height: 36.0,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: const Color(0xff66CA98),
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1.0,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SpaceWidth(
                  8,
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sintia",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Halo Dok, saya mau konsultasi, nih",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Color(
                            0xffB0BEC3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SpaceWidth(8),
                isActive
                    ? Container(
                        height: 18,
                        width: 18,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(
                            0xffFF6C52,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            const SpaceHeight(
              12,
            ),
          ],
        ),
      ),
    );
  }
}
