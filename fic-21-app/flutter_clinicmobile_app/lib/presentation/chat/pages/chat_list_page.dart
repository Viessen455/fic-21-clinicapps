import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clinicmobile_app/core/assets/assets.gen.dart';
import 'package:flutter_clinicmobile_app/core/components/spaces.dart';
import 'package:flutter_clinicmobile_app/core/constants/colors.dart';
import 'package:flutter_clinicmobile_app/core/extensions/build_context_ext.dart';
import 'package:flutter_clinicmobile_app/presentation/chat/pages/room_chat_page.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                  SpaceWidth(context.deviceWidth * 0.18),
                  const Text(
                    "Chat Premium",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SpaceHeight(14),
            GestureDetector(
              onTap: () {
                context.push(const RoomChatPage());
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                padding: const EdgeInsets.all(16.0),
                width: context.deviceWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  color: const Color(
                    0xffF5F5F5,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              Assets.images.doctor1.path,
                              width: 40.0,
                              height: 48.0,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 8,
                                width: 8,
                                decoration: const BoxDecoration(
                                  color: Color(0xff66CA98),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SpaceWidth(8),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "dr. Kiara Tasbiha",
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Spesialis kandungan",
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffB0BEC3),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Text(
                          "9:12",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffB0BEC3),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SpaceWidth(
                          48,
                        ),
                        const Expanded(
                          child: Text(
                            "Halo kak, bisa sampaikan keluhannya?",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffB0BEC3),
                            ),
                          ),
                        ),
                        const SpaceWidth(8),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            color: Color(0xffFF6C52),
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            "1",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.all(20.0),
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 12,
            //     vertical: 20,
            //   ),
            //   width: context.deviceWidth,
            //   decoration: BoxDecoration(
            //     color: AppColors.white,
            //     borderRadius: BorderRadius.circular(12.0),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Color(0x19000000),
            //         blurRadius: 24,
            //         offset: Offset(0, 11),
            //       ),
            //     ],
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const Text(
            //         "Pasien",
            //         style: TextStyle(
            //             fontSize: 14.0,
            //             fontWeight: FontWeight.w500,
            //             color: Colors.black),
            //       ),
            //       const SpaceHeight(
            //         8,
            //       ),
            //       CustomTextField(
            //         controller: TextEditingController(),
            //         label: 'Saiful Bahri',
            //       ),
            //       const SpaceHeight(
            //         20,
            //       ),
            //       const Text(
            //         "Pertanyaan",
            //         style: TextStyle(
            //             fontSize: 14.0,
            //             fontWeight: FontWeight.w500,
            //             color: Colors.black),
            //       ),
            //       const SpaceHeight(
            //         8,
            //       ),
            //       CustomTextFieldHeight(
            //         controller: TextEditingController(),
            //         label: 'Tulis Pertanyaan Anda',
            //       ),
            //       SpaceHeight(
            //         20,
            //       ),
            //       const Text.rich(
            //         TextSpan(
            //           children: [
            //             TextSpan(
            //               text:
            //                   'Dengan menfirimi peprtanyaan, Anda menyetujui ',
            //               style: TextStyle(
            //                 fontSize: 12.0,
            //                 fontWeight: FontWeight.w500,
            //                 color: Colors.black,
            //               ),
            //             ),
            //             TextSpan(
            //               text: 'kebijakan privasi',
            //               style: TextStyle(
            //                 fontSize: 12.0,
            //                 fontWeight: FontWeight.w500,
            //                 color: AppColors.primary,
            //               ),
            //             ),
            //             TextSpan(
            //               text: ' dan ',
            //               style: TextStyle(
            //                 fontSize: 12.0,
            //                 fontWeight: FontWeight.w500,
            //                 color: Colors.black,
            //               ),
            //             ),
            //             TextSpan(
            //               text: 'ketentuan layanan',
            //               style: TextStyle(
            //                 fontSize: 12.0,
            //                 fontWeight: FontWeight.w500,
            //                 color: AppColors.primary,
            //               ),
            //             ),
            //             TextSpan(
            //               text: ' aplikasi “Ayo Sehat”.',
            //               style: TextStyle(
            //                 fontSize: 12.0,
            //                 fontWeight: FontWeight.w500,
            //                 color: Colors.black,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       SpaceHeight(
            //         20,
            //       ),
            //       Button.filled(
            //         onPressed: () {},
            //         label: 'Mulai Chat',
            //         color: AppColors.primary,
            //         height: 48,
            //         borderRadius: 8,
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
