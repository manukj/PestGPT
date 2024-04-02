import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pest_gpt/src/localization/string.dart';
import 'package:pest_gpt/src/pages/landing/controller/landing_controller.dart';
import 'package:pest_gpt/src/resource/image.dart';

class LandingPage extends StatelessWidget {
  List<PageViewModel> listOfPages = [
    PageViewModel(
      title: "Welcome to Parllel Farm",
      body:
          'The "Farmer-Centred Interoperable Mobile-Cloud System" (FCIMCS) project, a collaborative effort spanning the UK and China',
      image: Center(
        child: Image.asset(ImagePath.welcomelanding_1),
      ),
    ),
    PageViewModel(
      title: "Title of custom body page",
      bodyWidget: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Click on "),
          Icon(Icons.edit),
          Text(" to edit a post"),
        ],
      ),
      image: const Center(child: Icon(Icons.android)),
    )
  ];
  final Controller c = Get.put(Controller());

  LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          titleWidget: SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Image.asset(ImagePath.welcomelanding_1, width: 350),
              ),
            ),
          ),
          bodyWidget: Column(children: [
            Text(
              StringText.welcomeToPFarm.tr,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              "The \"Farmer-Centred Interoperable Mobile-Cloud System\" (FCIMCS) project, a collaborative effort spanning the UK and China",
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/login");
              },
              child: const Text("Login"),
            ),
          ]),
        )
      ],
      showNextButton: false,
      showDoneButton: false,
      done: const Text("Done"),
      onDone: () {
        // On button pressed
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),
  //     body: Center(
  //       child: Column(
  //         children: [
  //           Text("hello".tr),
  //           ElevatedButton(
  //             child: const Text("Increment"),
  //             onPressed: () => c.increment(),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               Get.changeTheme(
  //                   Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
  //             },
  //             child: const Text("Change Theme"),
  //           ),
  //           ElevatedButton(
  //             child: const Text("Change language"),
  //             onPressed: () => {
  //               if (Get.locale == const Locale('en', 'US'))
  //                 {Get.updateLocale(const Locale('zh', 'CN'))}
  //               else
  //                 {Get.updateLocale(const Locale('en', 'US'))}
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
