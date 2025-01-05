import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinicmobile_app/core/assets/assets.gen.dart';
import 'package:flutter_clinicmobile_app/core/components/spaces.dart';
import 'package:flutter_clinicmobile_app/core/constants/colors.dart';
import 'package:flutter_clinicmobile_app/core/extensions/build_context_ext.dart';
import 'package:flutter_clinicmobile_app/presentation/telemedis/bloc/doctor_telemedis_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/telemedis/widgets/card_doctor_telemedis.dart';

class TelemedisPage extends StatefulWidget {
  const TelemedisPage({super.key});

  @override
  State<TelemedisPage> createState() => _TelemedisPageState();
}

class _TelemedisPageState extends State<TelemedisPage> {
  @override
  void initState() {
    context
        .read<DoctorTelemedisBloc>()
        .add(DoctorTelemedisEvent.getDoctorTelemedis());
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff1469F0),
      statusBarBrightness: Brightness.dark,
    ));
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 120,
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
                        Image.asset(
                          Assets.images.doctorCircle.path,
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SpaceHeight(
                136,
              ),
              BlocBuilder<DoctorTelemedisBloc, DoctorTelemedisState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    loaded: (doctors) {
                      return doctors.isEmpty
                          ? const Center(
                        child: Text('Data tidak ditemukan'),
                      )
                          : ListView.separated(
                        padding: const EdgeInsets.all(20),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: doctors.length,
                        separatorBuilder:
                            (BuildContext context, int index) {
                          return const SpaceHeight(10);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return CardDoctorTelemedis(
                            user: doctors[index],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 80.0,
              left: 20.0,
              right: 20.0,
            ),
            width: context.deviceWidth,
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
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
                      width: 55,
                      height: 60,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(
                          6,
                        ),
                      ),
                      child: Image.asset(
                        Assets.icons.hand.path,
                        width: 38.0,
                        height: 34.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SpaceWidth(16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Video Call Dokter di Ayo Sehat',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Layanan telemedis yang siap siaga untuk bantu kamu hidup lebih sehat.',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SpaceHeight(8),
                Container(
                  width: context.deviceWidth,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(
                      0xffF5F5F5,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: Color(0xff8C8C8C),
                      ),
                      const SpaceWidth(16),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Cari dokter atau spesialis',
                            hintStyle: TextStyle(
                              color: Color(
                                0xff8C8C8C,
                              ),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SpaceHeight(
                  10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 26,
                        width: 72,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primary.withOpacity(
                            0.2,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Semua',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      const SpaceWidth(16),
                      menu('Anak'),
                      const SpaceWidth(16),
                      menu('Kandungan'),
                      const SpaceWidth(16),
                      menu('Psikiater'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget menu(String title) {
    return Container(
      height: 26,
      width: 72,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffEFF2F1),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Color(0xffA7A6A5),
          ),
        ),
      ),
    );
  }
}
