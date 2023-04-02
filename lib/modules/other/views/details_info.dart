import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share/share.dart';



class InformationDetails extends StatelessWidget {
   const InformationDetails({super.key});
  //String id;

  _shareData() {
    Share.share('check out my website https://www.codewithflutter.com');
  }

  @override
  Widget build(BuildContext context) {
   // final Number number = ModalRoute.of(context)!.settings.arguments as Number;

    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    var id = arguments['id'];


   // final id = Get.parameters['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Information Details'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () => _shareData(), child: Icon(Icons.share)),
          )
        ],
      ),
      body: Center(
        child: Text('Coming from $id',
        style: TextStyle(fontSize: 16,color: Colors.blue[400]),)
      ),
    );

  }
}
