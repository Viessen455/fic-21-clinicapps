// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_clinicmobile_app/core/assets/assets.gen.dart';
import 'package:flutter_clinicmobile_app/core/components/buttons.dart';
import 'package:flutter_clinicmobile_app/core/components/spaces.dart';
import 'package:flutter_clinicmobile_app/core/constants/colors.dart';
import 'package:flutter_clinicmobile_app/core/extensions/build_context_ext.dart';
import 'package:flutter_clinicmobile_app/presentation/chat/pages/chat_with_doctor_page.dart';
import 'package:flutter_clinicmobile_app/presentation/chat/pages/detail_doctor_page.dart';

class CardDoctorChat extends StatelessWidget {
  final String image;
  final String name;
  final String clinic;
  final String spesialis;
  final String time;
  final String price;
  const CardDoctorChat({
    super.key,
    required this.image,
    required this.name,
    required this.clinic,
    required this.spesialis,
    required this.time,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(const DetailDoctorPage());
      },
      child: Container(
        width: context.deviceWidth,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
          boxShadow: [
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
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Image.asset(
                    image,
                    width: 87.0,
                    height: 87.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SpaceWidth(20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SpaceHeight(4),
                      Text(
                        spesialis,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      const SpaceHeight(10),
                      _itemRow(
                        Assets.icons.hospitalPrimary.path,
                        clinic,
                      ),
                      const SpaceHeight(8),
                      _itemRow(
                        Assets.icons.clockPrimary.path,
                        time,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SpaceHeight(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Harga Mulai",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                    const SpaceHeight(4),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff677294),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 120,
                  height: 34,
                  child: Button.filled(
                    borderRadius: 10,
                    onPressed: () {
                      context.push(const ChatWithDoctorPage());
                    },
                    label: 'Mulai Chat',
                    fontSize: 12.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _itemRow(String icon, String value) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 18.0,
          height: 18.0,
          fit: BoxFit.cover,
        ),
        const SpaceWidth(
          16,
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
