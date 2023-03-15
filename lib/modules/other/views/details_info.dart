import 'package:flutter/material.dart';
import 'package:flutter_demo/core/utils/dami_list.dart';
import 'package:flutter_demo/core/values/app_colors.dart';
import 'package:get/get.dart';

class InformationDetails extends StatelessWidget {
  const InformationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Information Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // receiving arguments by getx
              // Text('${Get.arguments['greeting']}, ${Get.arguments['name']}'),
              Text(
                DamiList.damiText1,
                style: TextStyle(
                  fontFamily: 'Roboto-Regular',
                  fontSize: 14.0,
                  height: 1.4,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              Text(
                DamiList.damiText2,
                style: TextStyle(
                  fontFamily: 'Roboto-Medium',
                  fontSize: 14.0,
                  height: 1.4,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ));
  }
}
