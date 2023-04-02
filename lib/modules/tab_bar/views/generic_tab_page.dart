import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenericTabPage extends StatelessWidget {
  const GenericTabPage({Key? key}) : super(key: key);

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
          title: Text("Generic $index"),
        );
      },
    );
  }
}