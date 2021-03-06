import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_package/controller/loading_controller.dart';
import 'package:master_package/views/pharmacy/pharma_test.dart';

import '../constants/constants.dart';
import '../widgets/cus_drawer.dart';
import '../widgets/dashboard_textbutton.dart';
import 'ambulance/ambulance_main_screen.dart';
import 'doctors/doc_test.dart';
import 'drugs/drug_test_screen.dart';
import 'hospitals/hospital_main_screen.dart';
import 'login_signup_resetpass/login_screen.dart';
import 'nurse/nurse_care_main_screen.dart';

class HomeScreen extends StatelessWidget {
  LoadingController loadingController = Get.put(LoadingController());

  HomeScreen({Key? key}) : super(key: key);


  //used for active drawer
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const CusDrawer(),
      appBar: AppBar(
        backgroundColor: AppColor.kDeepGreen,
        // titleSpacing: 80.0,
        title: const Center(
            child: Text(
          'Hello Pharmacy',
          style: TextStyle(fontSize: 30),
        )),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
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
      backgroundColor: AppColor.kDeepGreen,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Obx(() {
            if (loadingController.isLoading.value) {
              return Center(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: const CircularProgressIndicator(),
                ),
              );
            } else {
              return Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    aspectRatio: 16 / 9,
                    // autoPlayAnimationDuration: Duration(seconds: ),
                    autoPlayCurve: Curves.linear,
                    //height: MediaQuery.of(context).size.height * 0.35,
                    autoPlay: true,
                    reverse: false,
                    autoPlayInterval: const Duration(seconds: 3),
                    //pauseAutoPlayOnTouch: Duration(seconds: 10),
                  ),
                  items: [
                    'https://images.theconversation.com/files/256057/original/file-20190129-108364-17hlc1x.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1356&h=668&fit=crop',
                    'https://f.hubspotusercontent10.net/hub/491011/hubfs/pharmacy-background.jpg?length=2000&name=pharmacy-background.jpg',
                    'https://via.placeholder.com/600/92c952',
                    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
                    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
                  ].map((items) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: GestureDetector(
                            child: Column(
                              children: [
                                const Text("News for you"),
                                Expanded(
                                  child: Center(
                                    child: Image.network(
                                      items,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              debugPrint("Tapped");
                            },
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              );
            }
          }),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColor.kBackColor,
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
                            image: 'assets/images/drugs.jpg',
                            headlineText: "Drugs",
                            normalText: "     Look for drugs by types     ",
                          ),
                          DashboardTextButton(
                            onPress: () {
                              debugPrint("doctors pressed");
                              Get.to(() => DocTestScreen());
                            },
                            // iconData: Icons.person_outline,
                            image: 'assets/images/doctors.jpg',
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
                              Get.to(() => PharmaTest());
                            },
                            // iconData: Icons.local_pharmacy_outlined,
                            image: 'assets/images/pharmacy.jpg',
                            headlineText: "Pharmacy",
                            normalText: " Look for nearby pharmacies ",
                          ),
                          DashboardTextButton(
                            onPress: () {
                              debugPrint("hospitals pressed");
                              Get.to(() => HospitalMScreen());
                            },
                            // iconData: Icons.local_hospital_outlined,
                            image: 'assets/images/hospitals.jpg',
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
                            image: 'assets/images/ambulance.png',
                            headlineText: "Ambulance",
                            normalText: " Look for ambulance ",
                          ),
                          DashboardTextButton(
                            onPress: () {
                              debugPrint("nurse_care pressed");
                              Get.to(() => const NurseCareScreen());
                            },
                            // iconData: Icons.local_hospital_outlined,
                            image: 'assets/images/nurse_care.png',
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
