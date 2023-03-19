import 'package:flutter/material.dart';
import 'package:flutter_demo/core/utils/dami_list.dart';
import 'package:flutter_demo/routes/app_pages.dart';
import 'package:get/get.dart';

class InformationList extends StatelessWidget {
  const InformationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Information'),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            title: Text('${DamiList.informationItems[index].name}'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Get.toNamed(Routes.INFORMATION_DETAILS, arguments: {
                "id": DamiList.informationItems[index].id,
              });
            },
          ),
          separatorBuilder: (context, index) => const Divider(
            height: 0.1, // set the height of the divider
            color: Colors.grey, // set the color of the divider
          ),
          itemCount: DamiList.informationItems.length,
        ));
  }
}
