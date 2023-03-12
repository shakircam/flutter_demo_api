import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/user_info.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setting')),
      body: Center(
        child: FutureBuilder<User?>(
          future: getUserLoginState(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              print("user email: ${snapshot.error} ");
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data == null) {
              return Text('User not logged in');
            } else {
              final userEmail = snapshot.data!.userEmail;
              final password = snapshot.data!.password;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email: $userEmail'),
                    SizedBox( height: 10,),
                    Text('Password: $password'),
                  ],
                ),
              );

            }
          },
        ),
      ),
    );
  }

  Future<User?> getUserLoginState() async {
    const storage = FlutterSecureStorage();
    final userEmail = await storage.read(key: 'userEmail');
    final password = await storage.read(key: 'password');
    if (userEmail != null && password != null) {
      print("user email: ${userEmail} password: ${password}");

      dynamic user = User.fromJson({'userEmail': userEmail, 'password': password});
      print("user email: ${user.userEmail} password: ${user.password}");
      return user;
    } else {
      return null;
    }
  }
}
