import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pest_gpt/src/localization/string.dart';
import 'package:pest_gpt/src/resource/image.dart';

class IntroPage extends StatelessWidget {
  final List<PageViewModel> listOfPages = [
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

  IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [page1(), page2(), page3(), page4()],
      showNextButton: false,
      showDoneButton: false,
      done: const Text("Done"),
      onDone: () {
        // On button pressed
      },
    );
  }

  PageViewModel page1() {
    return PageViewModel(
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
            // Get.toNamed("/login");
          },
          child: const Text("Login"),
        ),
      ]),
    );
  }

  PageViewModel page2() {
    return PageViewModel(
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
    );
  }

  PageViewModel page3() {
    return PageViewModel(
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
    );
  }

  PageViewModel page4() {
    return PageViewModel(
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
    );
  }
}
