// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_clinicmobile_app/core/assets/assets.gen.dart';
import 'package:flutter_clinicmobile_app/core/components/buttons.dart';
import 'package:flutter_clinicmobile_app/core/components/spaces.dart';
import 'package:flutter_clinicmobile_app/core/constants/colors.dart';
import 'package:flutter_clinicmobile_app/core/extensions/build_context_ext.dart';
import 'package:flutter_clinicmobile_app/presentation/doctor/telemedis/pages/vidcall_dcotor_page.dart';

class CardTelemedisDoctor extends StatelessWidget {
  final bool isActive;
  const CardTelemedisDoctor({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.deviceWidth,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(18.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 20,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image.asset(
              Assets.images.doctorVidcall2.path,
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
                const Text(
                  'Telemedis',
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  "Sintia",
                  style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w400,
                      color: Color(
                        0xffB0BEC3,
                      )),
                ),
                const SpaceHeight(8),
                const Text(
                  '20 November 2024, Pukul 17:45',
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                const SpaceHeight(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Bayar",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                        SpaceHeight(4),
                        Text(
                          'Rp. 19.000',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff677294),
                          ),
                        ),
                      ],
                    ),
                    isActive
                        ? SizedBox(
                            width: 83,
                            height: 25,
                            child: Button.filled(
                              borderRadius: 4,
                              onPressed: () {
                                context.push(const VidCallDoctorPage());
                              },
                              label: 'Gabung',
                              fontSize: 12.0,
                            ),
                          )
                        : Container(
                            width: 77,
                            height: 25,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6.0,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xff25B865).withOpacity(
                                0.1,
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: const BoxDecoration(
                                    color: Color(
                                      0xff25B865,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const Text(
                                  "Selesai",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(
                                      0xff25B865,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
