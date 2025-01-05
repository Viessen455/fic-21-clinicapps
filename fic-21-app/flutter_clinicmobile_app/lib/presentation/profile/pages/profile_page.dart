import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clinicmobile_app/core/assets/assets.gen.dart';
import 'package:flutter_clinicmobile_app/core/components/spaces.dart';
import 'package:flutter_clinicmobile_app/core/constants/colors.dart';
import 'package:flutter_clinicmobile_app/core/extensions/build_context_ext.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
              child: const Center(
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            const SpaceHeight(14),
            Padding(
              padding: const EdgeInsets.all(
                20,
              ),
              child: Row(
                children: [
                  Image.asset(
                    Assets.images.doctorCircle.path,
                    width: 72.0,
                    height: 72.0,
                    fit: BoxFit.cover,
                  ),
                  const SpaceWidth(
                    16,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sintia",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "sintia@gmail.com",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Color(
                            0xff8C8C8C,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SpaceHeight(
              12,
            ),
            _menuItem(Assets.icons.document.path, 'Kebijakan Layanan'),
            const SpaceHeight(16),
            _menuItem(Assets.icons.help.path, 'Bantuan'), const SpaceHeight(16),
            _menuItem(Assets.icons.logout.path, 'Keluarga'),
            const SpaceHeight(16),
            // Padding(
            //   padding: EdgeInsets.only(top: context.deviceHeight * 0.2, left: 20, right: 20),
            //   child: EmptyWidget(),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(final String image, final String title) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(
              0xff677294,
            ).withOpacity(0.16),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: Color(
                0xffF5F5F5,
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                image,
                width: 24.0,
                height: 24.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SpaceWidth(16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Color(
                0xff000000,
              ),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            size: 24,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
