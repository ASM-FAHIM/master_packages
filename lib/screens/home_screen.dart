import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:master_package/screens/ambulance/ambulance_main_screen.dart';
import 'package:master_package/screens/doctors/doctors_main_screen.dart';
import 'package:master_package/screens/drugs/drug_test_screen.dart';
import 'package:master_package/screens/hospitals/hospital_main_screen.dart';
import 'package:master_package/screens/login_signup_resetpass/login_screen.dart';
import 'package:master_package/screens/nurse/nurse_care_main_screen.dart';
import 'package:master_package/screens/pharmacy/pharmacy_main_screen.dart';

import '../constants/constants.dart';
import '../widgets/dashboard_textbutton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDeepGreen,
        // titleSpacing: 80.0,
        title: const Center(
            child: Text(
          'Hello Pharmacy',
          style: TextStyle(fontSize: 30),
        )),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              size: 25,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => LoginScreen());
              },
              icon: const Icon(
                Icons.logout,
                size: 25,
              ))
        ],
      ),
      backgroundColor: kDeepGreen,
      body: Column(
        children: [
          SizedBox(
            height: 270,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 170.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                aspectRatio: 16 / 9,
                // autoPlayAnimationDuration: Duration(seconds: ),
                autoPlayCurve: Curves.linear,
                //height: MediaQuery.of(context).size.height * 0.35,
                autoPlay: true,
                reverse: false,
                autoPlayInterval: Duration(seconds: 3),
                //pauseAutoPlayOnTouch: Duration(seconds: 10),
              ),
              items: [
                "ACE PLUS",
                "NAPA EXTRA",
                "FINIX",
                "FLEXI 2.5mg",
                "MD. Ahsanul Haque Hridoy",
                "Md. Farhan Nasif",
                "New Product Invented click here to know",
                "New OT Machine",
                "MEdical Belt",
                "Health Care Tips",
              ].map((items) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      child: GestureDetector(
                        child: Center(
                          child: Text(
                            items,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onTap: () {
                          print("Tapped");
                        },
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: kBackColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DashboardTextButton(
                            onPress: () {
                              debugPrint("drugs pressed");
                              Get.to(() => MedScreen());
                            },
                            // iconData: Icons.shop_two_sharp,
                            image: 'images/drugs.jpg',
                            headlineText: "Drugs",
                            normalText: "     Look for drugs by types     ",
                          ),
                          DashboardTextButton(
                            onPress: () {
                              debugPrint("doctors pressed");
                              Get.to(() => const DoctorMScreen());
                            },
                            // iconData: Icons.person_outline,
                            image: 'images/doctors.jpg',
                            headlineText: "Doctors",
                            normalText: "       Look for best doctors       ",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DashboardTextButton(
                            onPress: () {
                              debugPrint("pharmacy pressed");
                              Get.to(() => const PharmacyScreen());
                            },
                            // iconData: Icons.local_pharmacy_outlined,
                            image: 'images/pharmacy.jpg',
                            headlineText: "Pharmacy",
                            normalText: " Look for nearby pharmacies ",
                          ),
                          DashboardTextButton(
                            onPress: () {
                              debugPrint("hospitals pressed");
                              Get.to(() => HospitalMScreen());
                            },
                            // iconData: Icons.local_hospital_outlined,
                            image: 'images/hospitals.jpg',
                            headlineText: "Hospitals",
                            normalText: "   Look for nearby hospitals   ",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DashboardTextButton(
                            onPress: () {
                              debugPrint("ambulance pressed");
                              Get.to(() => const AmbulanceScreen());
                            },
                            // iconData: Icons.local_pharmacy_outlined,
                            image: 'images/ambulance.png',
                            headlineText: "Ambulance",
                            normalText: " Look for ambulance ",
                          ),
                          DashboardTextButton(
                            onPress: () {
                              debugPrint("nurse_care pressed");
                              Get.to(() => const NurseCareScreen());
                            },
                            // iconData: Icons.local_hospital_outlined,
                            image: 'images/nurse_care.png',
                            headlineText: "Nurse-care",
                            normalText: "   Look for Nurse-care  ",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
