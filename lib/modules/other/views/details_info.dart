import 'package:flutter/material.dart';
import 'package:flutter_demo/core/utils/dami_list.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

import '../controller/details_controller.dart';

class InformationDetails extends StatelessWidget {
   InformationDetails({super.key});

  _shareData() {
    Share.share('check out my website https://www.codewithflutter.com');
  }


  @override
  Widget build(BuildContext context) {

    final id = Get.arguments['id'];
    // Use the ID to display the details
    if (id != null) {
      // Use the ID to display the details
      return Scaffold(
        appBar: AppBar(
          title: Text('${Get.arguments['id']}'),
        ),
        body: Center(
          child: Text('Details for ID $id'),
        ),
      );
    } else {
      // Handle the case when the ID is null
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Invalid ID'),
        ),
      );
    }

    //   Scaffold(
    //   appBar: AppBar(
    //     title: Text('Details'),
    //   ),
    //   body: Center(
    //     child: GetBuilder<DetailsController>(
    //       init: DetailsController(),
    //       builder: (controller) {
    //         return
    //           Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(controller.getData.des ?? 'No description provided.'),
    //               SizedBox(height: 10,),
    //               Text(controller.getData.id.toString() ?? "Default id 1"),
    //             ],
    //           );
    //       },
    //     ),
    //   ),
    // );

  }
}
