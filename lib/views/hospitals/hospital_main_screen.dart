import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_package/constants/constants.dart';

import 'hospitals_list_screen.dart';

class HospitalMScreen extends StatefulWidget {
  const HospitalMScreen({Key? key}) : super(key: key);

  @override
  State<HospitalMScreen> createState() => _HospitalMScreenState();
}

class _HospitalMScreenState extends State<HospitalMScreen> {
  TextEditingController searchController = TextEditingController();
  Icon cusIcon = const Icon(Icons.search_outlined);
  Widget cusSearchBar = const Text("Hospitals");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          titleSpacing: 5,
          title: cusSearchBar,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (cusIcon.icon == Icons.search_outlined) {
                    cusIcon = const Icon(Icons.cancel);
                    cusSearchBar = TextField(
                      controller: searchController,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: AppColor.kBackColor,
                        hintText: "Search for medicines",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    );
                  } else {
                    cusIcon = const Icon(Icons.search_outlined);
                    cusSearchBar = const Text("Hospitals ");
                  }
                });
              },
              icon: cusIcon,
            ),
          ],
        ),
        body: Column(
          children: const [
            HospitalListScreen(),
          ],
        ));
  }
}
