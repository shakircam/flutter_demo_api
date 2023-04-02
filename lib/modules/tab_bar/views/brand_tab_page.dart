import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrandTabPage extends StatelessWidget {
  const BrandTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          thickness: 2,
          color: Colors.grey[300],
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("Brand $index"),
        );
      },
    );
  }
}
