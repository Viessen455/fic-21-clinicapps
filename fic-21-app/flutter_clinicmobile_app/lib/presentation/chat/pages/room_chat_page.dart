import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clinicmobile_app/core/assets/assets.gen.dart';
import 'package:flutter_clinicmobile_app/core/components/spaces.dart';
import 'package:flutter_clinicmobile_app/core/constants/colors.dart';
import 'package:flutter_clinicmobile_app/core/extensions/build_context_ext.dart';
import 'package:flutter_clinicmobile_app/presentation/chat/widgets/chat_bubble.dart';

class RoomChatPage extends StatelessWidget {
  const RoomChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff1469F0),
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Column(
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
                  // SpaceWidth(context.deviceWidth * 0.1),
                  CircleAvatar(
                    backgroundColor: AppColors.gray,
                    child: Image.asset(
                      Assets.images.doctor1.path,
                      width: 30.0,
                      height: 30.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SpaceWidth(8),
                  const Text(
                    "dr Kiara Tasbiha",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SpaceHeight(12),
            const Center(
              child: Text(
                "16, November 2024",
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            const SpaceHeight(12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ChatBubble(
                direction: Direction.right,
                message: 'Dok, sering pusing dan mual ketika pagi, kenapa ya?',
                type: BubbleType.top,
                clock: "10.05 WIB",
              ),
            ),
            const SpaceHeight(20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ChatBubble(
                direction: Direction.left,
                message: 'Apakah sudah sarapan?',
                type: BubbleType.top,
                clock: "10.10 WIB",
              ),
            ),
            const SpaceHeight(20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ChatBubble(
                  direction: Direction.right,
                  message: 'Belum dok, biasanya saya sarapan jam 12 siang',
                  type: BubbleType.top,
                  clock: "10.11 WIB"),
            ),
            const SpaceHeight(20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ChatBubble(
                direction: Direction.left,
                message: 'Coba mulai sarapan jam 7 pagi, dan minum air putih',
                type: BubbleType.top,
                clock: "10.12 WIB",
              ),
            ),
            const SpaceHeight(20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ChatBubble(
                direction: Direction.left,
                message: 'Sesi konsultasi ditutup oleh aplikasi',
                type: BubbleType.top,
                clock: "10.30 WIB",
              ),
            ),
            const Spacer(),
            Container(
              width: context.deviceWidth,
              height: 80.0,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 234, 242, 242),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Row(
                        children: [
                          const SpaceWidth(16),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Type a message",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.send,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SpaceWidth(16),
                  GestureDetector(
                      onTap: () {}, child: const Icon(Icons.camera_alt)),
                  const SpaceWidth(16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
