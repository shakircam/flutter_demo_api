import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

import '../controller/input_validator.dart';

class LoginPage extends StatelessWidget with InputValidationMixin{
   LoginPage({Key? key}) : super(key: key);
  final formGlobalKey = GlobalKey < FormState > ();
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions:  <Widget>[
          Padding(
              padding: const EdgeInsets.all( 10.0),
            child : ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0, // Set the elevation to 8.0
              ),
              onPressed: () {},
              child: Text("Logout"),
            ),

          ),
        ],
      ),
      body:  Form(
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
                    validator: (value) =>
                      isEmailValid(value!),
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
                    validator: (value) =>
                        validatePassword(value!),
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
                        // use the email provided here
                        saveUserLoginState(_emailController.text, _passwordController.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                            content: Text('Login successful \n ${_emailController.text} \n ${_passwordController.text}'),
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

              ],
            ),

        ),
      ),
    );
  }

   void saveUserLoginState(String username, String password) async {
     const storage = FlutterSecureStorage();
     await storage.write(key: 'userEmail', value: username);
     await storage.write(key: 'password', value: password);
   }

}
