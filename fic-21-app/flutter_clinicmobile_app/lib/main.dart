import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clinicmobile_app/core/constants/colors.dart';
import 'package:flutter_clinicmobile_app/data/datasources/agora_remote_datasource.dart';
import 'package:flutter_clinicmobile_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_clinicmobile_app/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_clinicmobile_app/data/datasources/doctor_remote_datasource.dart';
import 'package:flutter_clinicmobile_app/data/datasources/order_remote_datasource.dart';
import 'package:flutter_clinicmobile_app/data/datasources/specialation_remote_datasource.dart';
import 'package:flutter_clinicmobile_app/data/datasources/user_remote_datasource.dart';
import 'package:flutter_clinicmobile_app/data/models/response/login_response_model.dart';
import 'package:flutter_clinicmobile_app/firebase_options.dart';
import 'package:flutter_clinicmobile_app/presentation/admin/doctor/blocs/add_doctor/add_doctor_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/admin/doctor/blocs/delete_doctor/delete_doctor_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/admin/doctor/blocs/get_specialations/get_specialations_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/admin/doctor/blocs/update_doctor/update_doctor_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/admin/home/blocs/get_clinic/get_clinic_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/admin/home/pages/admin_main_page.dart';


import 'package:flutter_clinicmobile_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/auth/bloc/login_google/login_google_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/auth/bloc/update_google_id/update_google_id_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/auth/bloc/update_user/update_user_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/auth/pages/onboarding_page.dart';
import 'package:flutter_clinicmobile_app/presentation/chat/blocs/create_order/create_order_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/chat/blocs/get_doctors/get_doctors_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/chat/blocs/get_doctors_active/get_doctors_active_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/admin/home/blocs/get_orders_clinic/get_orders_clinic_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/chat/blocs/xendit_callback/xendit_callback_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/doctor/chat/blocs/active_orders/active_orders_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/doctor/chat/blocs/inactive_orders/inactive_orders_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/doctor/history/history_order_doctor/history_order_doctor_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/history/blocs/get_orders_patient/get_orders_patient_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/home/pages/home_page.dart';
import 'package:flutter_clinicmobile_app/presentation/telemedis/blocs/add_agora_call/add_agora_call_bloc.dart';
import 'package:flutter_clinicmobile_app/presentation/telemedis/blocs/get_agora_calls/get_agor_calls_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'presentation/doctor/home/pages/doctor_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  OneSignal.Debug.setLogLevel(OSLogLevel.debug);
  // NOTE: Replace with your own app ID from https://www.onesignal.com
  OneSignal.initialize('020c6c55-a1b1-49a0-bb12-695ebe0e7df0');
  OneSignal.Notifications.requestPermission(true);
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
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LoginGoogleBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
        // BlocProvider(
        //   create: (context) => CheckUserBloc(UserRemoteDatasource()),
        // ),
        // BlocProvider(
        //   create: (context) => CreateUserBloc(UserRemoteDatasource()),
        // ),
        // BlocProvider(
        //   create: (context) => GetUserEmailBloc(UserRemoteDatasource()),
        // ),
        BlocProvider(
          create: (context) => UpdateGoogleIdBloc(UserRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => UpdateUserBloc(UserRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetDoctorsBloc(DoctorRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AddDoctorBloc(DoctorRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => UpdateDoctorBloc(DoctorRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DeleteDoctorBloc(DoctorRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetOrdersClinicBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CreateOrderBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetAgorCallsBloc(AgoraRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AddAgoraCallBloc(AgoraRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ActiveOrdersBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => InactiveOrdersBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => HistoryOrderDoctorBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetDoctorsActiveBloc(DoctorRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetOrdersPatientBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              GetSpecialationsBloc(SpecialationRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => XenditCallbackBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetClinicBloc(DoctorRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
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
        home: FutureBuilder<LoginResponseModel?>(
            future: AuthLocalDatasource().getUserData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  //check role
                  if (snapshot.data!.data!.user!.role == 'doctor') {
                    return const DoctorHomePage();
                  } else if (snapshot.data!.data!.user!.role == 'admin') {
                    return const AdminMainPage();
                  }
                  return const HomePage();
                } else {
                  return const OnboardingPage();
                }
              }
              return const OnboardingPage();
            }),
      ),
    );
  }
}
