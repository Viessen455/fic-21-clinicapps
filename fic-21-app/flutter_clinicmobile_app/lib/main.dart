import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinicmobile_app/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_clinicmobile_app/data/datasources/doctor_remote_datasource.dart';
import 'package:flutter_clinicmobile_app/presentation/auth/bloc/login_google/login_google_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/auth/pages/onboarding_page.dart';
import 'package:flutter_clinicmobile_app/presentation/doctor/telemedis/pages/telemedis_doctor_page.dart';
import 'package:flutter_clinicmobile_app/presentation/home/pages/home_page.dart';
import 'package:flutter_clinicmobile_app/presentation/telemedis/bloc/doctor_telemedis_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/constants/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primary,
      statusBarBrightness: Brightness.dark,
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DoctorTelemedisBloc(DoctorRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => LoginGoogleBloc(AuthRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme
                .of(context)
                .textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.poppins(
              color: AppColors.primary,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.primary,
            ),
          ),
        ),
        home: const OnboardingPage(),
      ),
    );
  }
}

