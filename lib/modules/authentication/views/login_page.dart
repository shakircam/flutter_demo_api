import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/core/base/base_view.dart';
import 'package:flutter_demo/core/widget/custom_app_bar.dart';
import 'package:flutter_demo/modules/setting/controller/setting_controller.dart';
import 'package:get/get.dart';


import '../controller/input_validator.dart';

class LoginPage extends BaseView<SettingController> with InputValidationMixin {
  LoginPage() {
    Get.put(SettingController());
  }

  final formGlobalKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Login',
    );
  }

  @override
  Widget body(BuildContext context) {
    return Form(
      key: formGlobalKey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _emailController,
                validator: (value) => isEmailValid(value!),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _passwordController,
                validator: (value) => validatePassword(value!),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter password'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (formGlobalKey.currentState!.validate()) {
                    formGlobalKey.currentState?.save();
                    controller.increment();
                    // use the email provided here
                    controller.saveUserLoginState(
                        _emailController.text, _passwordController.text);
                    controller.getLoginInfo();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Login successful \n ${_emailController.text} \n ${_passwordController.text}'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    elevation: 12.0,
                    textStyle: const TextStyle(color: Colors.white)),
                child: const Text('Login'),
              ),
            ),
            Obx(() => Text("Number is: ${controller.count}")),
            Text('Dynamic: ${Get.parameters['id']}'),
          ],
        ),
      ),
    );
  }
}
