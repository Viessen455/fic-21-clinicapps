// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_clinicmobile_app/core/assets/assets.gen.dart';
import 'package:flutter_clinicmobile_app/core/components/spaces.dart';
import 'package:flutter_clinicmobile_app/core/constants/colors.dart';
import 'package:flutter_clinicmobile_app/core/extensions/build_context_ext.dart';

class CardPremiumChat extends StatelessWidget {
  const CardPremiumChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.deviceWidth,
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
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
                  Assets.images.doctor1.path,
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
                      'dr. Kiara Tasbiha',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SpaceHeight(4),
                    const Text(
                      'Spesialis kandungan',
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    const SpaceHeight(10),
                    _itemRow(
                      Assets.icons.hospitalPrimary.path,
                      'Klinik Sehat Prima',
                      16.0,
                    ),
                    const SpaceHeight(8),
                    _itemRow(
                      Assets.icons.clockPrimary.path,
                      '11:00 - 12:00 WIB',
                      16.0,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SpaceHeight(12),
          _itemRow(
            Assets.icons.likeShapes.path,
            'Akurasi penangan konsultasi',
            4.0,
          ),
          const SpaceHeight(8),
          _itemRow(
            Assets.icons.likeShapes.path,
            'Privasi pertanyaan Pengguna',
            4.0,
          )
        ],
      ),
    );
  }

  Widget _itemRow(String icon, String value, double spaceWidth) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: spaceWidth == 4.0 ? 24.0 : 18.0,
          height: spaceWidth == 4.0 ? 24.0 : 18.0,
          fit: BoxFit.cover,
        ),
        SpaceWidth(
          spaceWidth,
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: spaceWidth == 4.0 ? 12.0 : 10.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
