import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_loader.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';
import 'package:pest_gpt/src/common_widget/common_text_field.dart';
import 'package:pest_gpt/src/common_widget/powered_by.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/models/user/user_login_request.dart';
import 'package:pest_gpt/src/pages/login/widget/alternative_options.dart';
import 'package:pest_gpt/src/pages/login/widget/forgot_password.dart';
import 'package:pest_gpt/src/pages/login/widget/header.dart';
import 'package:pest_gpt/src/resource/api_service/user_service.dart';
import 'package:pest_gpt/src/utils/common_util.dart';
import 'package:pest_gpt/src/utils/toast/toast_manager.dart';
import 'package:toastification/toastification.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonScaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [LoginWidget(), PoweredBy()],
        ),
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    super.key,
  });

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    if (emailController.text.isEmpty) {
      ToastManager.showError(StringConstant.emailCannotBeEmpty.tr);
      return;
    }
    if (passwordController.text.isEmpty) {
      ToastManager.showError(StringConstant.passwordCannotBeEmpty.tr);
      return;
    }
    if (!CommonUtil.isValidEmail(emailController.text)) {
      ToastManager.showError(StringConstant.invalidEmail.tr);
      return;
    }
    final response = await UserService().login(UserLoginRequest(
      email: emailController.text,
      password: passwordController.text,
    ));
    if (response.accessToken != null) {
      print(response.accessToken);
    } else {
      toastification.show(
          context: Get.context, title: const Text('Something went wrong'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CommonLoader()
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoginHeader(),
              const SizedBox(height: 20),
              CommonTextField(
                hintText: StringConstant.email.tr,
                prefixIcon: const Icon(Icons.email),
                textController: emailController,
              ),
              const SizedBox(height: 20),
              CommonTextField(
                hintText: StringConstant.password.tr,
                prefixIcon: const Icon(Icons.vpn_key),
                textController: passwordController,
              ),
              const ForgotPassword(),
              const SizedBox(height: 10),
              CommonPrimaryButton(
                onPressed: login,
                titleWidget: Text(StringConstant.signIn.tr),
              ),
              const SizedBox(height: 20),
              const AlternativeOptions(),
            ],
          );
  }
}
