import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/Intro/controller/intro_controler.dart';
import 'package:pest_gpt/src/pages/login/login.dart';
import 'package:pest_gpt/src/pages/registration/registration.dart';
import 'package:pest_gpt/src/resource/image_path.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [page1(), page2(), page3(), page4()],
      showSkipButton: true,
      done: const Icon(Icons.done),
      next: const Icon(Icons.arrow_right_outlined),
      skip: const Text("Skip"),
      onDone: () async {
        await Get.find<IntroController>().markIntroAsSeen();
        Get.to(const Registration());
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
            child: Image.asset(IMAGEPATH.welcomelanding_1, width: 350),
          ),
        ),
      ),
      bodyWidget: Column(
        children: [
          Text(
            StringConstant.welcomeToPFarm.tr,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            "The \"Farmer-Centred Interoperable Mobile-Cloud System\" (FCIMCS) project, a collaborative effort spanning the UK and China",
          ),
          const SizedBox(
            height: 20,
          ),
          CommonPrimaryButton(
            onPressed: () {
              Get.to(const Login());
            },
            title: StringConstant.signIn.tr,
          ),
        ],
      ),
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
