import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clinicmobile_app/core/components/buttons.dart';
import 'package:flutter_clinicmobile_app/core/components/spaces.dart';
import 'package:flutter_clinicmobile_app/core/constants/colors.dart';
import 'package:flutter_clinicmobile_app/core/extensions/build_context_ext.dart';
import 'package:flutter_clinicmobile_app/presentation/chat/pages/payment_page.dart';
import 'package:flutter_clinicmobile_app/presentation/chat/widgets/card_premium_chat.dart';

class PremiumChatPage extends StatelessWidget {
  const PremiumChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff1469F0),
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
        backgroundColor: AppColors.lightBackground,
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
          height: 77,
          width: context.deviceWidth,
          decoration: const BoxDecoration(
            color: AppColors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Biaya Konsultasi",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    "Rp. 40.000",
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600,
                      color: Color(
                        0xff677294,
                      ),
                    ),
                  ),
                ],
              ),
              Button.filled(
                width: 120,
                height: 40,
                borderRadius: 10,
                onPressed: () {
                  context.push(const PaymentPage());
                },
                label: 'Chat Sekarang',
                fontSize: 12.0,
              )
            ],
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                width: context.deviceWidth,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                      ),
                    ),
                    SpaceWidth(context.deviceWidth * 0.2),
                    const Text(
                      "Premium Chat",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: CardPremiumChat(),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 24,
                ),
                width: context.deviceWidth,
                decoration: BoxDecoration(
                  color: AppColors.lightYellow,
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: AppColors.yellow,
                          size: 20,
                        ),
                        SpaceWidth(12),
                        Text(
                          "Ketentuan Penggunaan",
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500,
                            color: Color(
                              0xff1E293B,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SpaceHeight(8),
                    Text(
                      "Fasilitas ini bisa memberi diagnosa awal dalam kondisi pengguna. Chat di aplikasi tidak menggantikan interaksi fisik Dokter. Dokter akan meresepkan obat sesuai aturan berdasarkan informasi dari pengguna.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffB2B2B2),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
