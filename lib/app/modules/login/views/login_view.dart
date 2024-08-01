import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:note_app_flutter_getx_firebase/widgets/custom_form_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 100,
              horizontal: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Hello there,\nWelocome back',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: controller.formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                          hintText: "EMAIL",
                          iconData: Icons.email,
                          textEditingController: controller.email,
                          validator: (v) => controller.validateEmail(v),
                          obscureText: false,
                        ),

                        CustomTextField(
                          hintText: "PASSWORD",
                          iconData: Icons.security,
                          textEditingController: controller.password,
                          validator: (v) => controller.validatePassword(v),
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: controller.login,
                  child: const Text(
                    "SIGN IN",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "New here?  ",
                      style: TextStyle(
                        // color: Colors.grey.shade900,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: controller.toSingUp,
                      child: const Text(
                        "Sign up instead",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
