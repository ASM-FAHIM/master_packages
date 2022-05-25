import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:master_package/constants/constants.dart';
import 'package:master_package/screens/ambulance/ambulance_main_screen.dart';
import 'package:master_package/screens/cart_screen.dart';
import 'package:master_package/screens/dashboard_screen.dart';
import 'package:master_package/screens/doctors/doctors_main_screen.dart';
import 'package:master_package/screens/drugs/drus_main_screen.dart';
import 'package:master_package/screens/hospitals/hospital_main_screen.dart';
import 'package:master_package/screens/login_signup_resetpass/create_account_screen.dart';
import 'package:master_package/screens/login_signup_resetpass/login_screen.dart';
import 'package:master_package/screens/login_signup_resetpass/reset_confirm_pass_screen.dart';
import 'package:master_package/screens/login_signup_resetpass/reset_pass_screen.dart';
import 'package:master_package/screens/nurse/nurse_care_main_screen.dart';
import 'package:master_package/screens/pharmacy/pharmacy_main_screen.dart';
import 'package:master_package/screens/profile_screen.dart';
import 'package:master_package/screens/search_screen.dart';
import 'package:master_package/screens/splash_screen.dart';
import 'package:master_package/screens/user_screen.dart';

void main() async {
  Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello Pharma',
      theme: ThemeData().copyWith(
        // primaryColor: Color(0xFF28706F),
        scaffoldBackgroundColor: kDeepGreen,
        appBarTheme:
            AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
      ),
      defaultTransition: Transition.zoom,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/user', page: () => UserScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/forgot_pass', page: () => ResetPassScreen()),
        GetPage(name: '/reset_conf', page: () => ResetConfirmPassScreen()),
        GetPage(name: '/create_acc', page: () => CreateAccountScreen()),
        GetPage(name: '/dashboard', page: () => DashboardScreen()),
        GetPage(name: '/user', page: () => UserScreen()),
        GetPage(name: '/search', page: () => SearchScreen()),
        GetPage(name: '/cart', page: () => CartScreen()),
        GetPage(name: '/cart', page: () => ProfileScreen()),
        GetPage(name: '/drug', page: () => DrugMainScreen()),
        GetPage(name: '/doctor', page: () => DoctorMScreen()),
        GetPage(name: '/pharmacy', page: () => PharmacyScreen()),
        GetPage(name: '/hospital', page: () => HospitalMScreen()),
        GetPage(name: '/ambulance', page: () => AmbulanceScreen()),
        GetPage(name: '/nurse', page: () => NurseCareScreen()),
      ],
      // home: SplashScreen(),
    );
  }
}
