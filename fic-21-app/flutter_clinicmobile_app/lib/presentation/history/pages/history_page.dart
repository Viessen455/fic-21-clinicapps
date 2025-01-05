import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clinicmobile_app/core/components/spaces.dart';
import 'package:flutter_clinicmobile_app/core/constants/colors.dart';
import 'package:flutter_clinicmobile_app/core/extensions/build_context_ext.dart';
import 'package:flutter_clinicmobile_app/presentation/history/widgets/empty_widget.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

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
                  "Chat Premium",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            const SpaceHeight(14),
            // const Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 20,
            //   ),
            //   child: CardHistory(),
            // ),
            Padding(
              padding: EdgeInsets.only(
                  top: context.deviceHeight * 0.2, left: 20, right: 20),
              child: const EmptyWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
