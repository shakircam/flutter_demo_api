import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/modules/tab_bar/views/product_widget.dart';

class TherapeticTabPage extends StatefulWidget {
  const TherapeticTabPage({Key? key}) : super(key: key);

  @override
  State<TherapeticTabPage> createState() => _TherapeticTabPageState();
}

class _TherapeticTabPageState extends State<TherapeticTabPage> {
  List<User> userList = [];

  final List<String> salaryList = [
    '1000',
    '2000',
    '3000',
    '4000',
    '5000',
  ];

  void addUser() {
    setState(() {
      userList.add(
        User(name: 'New User', selectedSalary: null),
      );
    });
  }

  void deleteUser(int index) {
    setState(() {
      userList.removeAt(index);
    });
  }

  int calculateTotalSalary(List<User> userList) {
    int totalSalary = 0;
    for (User user in userList) {
      if (user.selectedSalary != null) {
        totalSalary += int.parse(user.selectedSalary!);
      }
    }
    return totalSalary;
  }

  void showTotalSalarySnackbar(BuildContext context, int totalSalary) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Total Salary: $totalSalary'),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: userList.length,
            itemBuilder: (BuildContext context, int index) {
              User user = userList[index];
              return ListTile(
                title: TextField(
                  onChanged: (value) {
                    user.name = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  //controller: TextEditingController(text: user.name),
                ),
                subtitle: DropdownButton<String>(
                  value: user.selectedSalary,
                  onChanged: (String? newValue) {
                    setState(() {
                      user.selectedSalary = newValue;
                    });
                  },
                  items: salaryList
                      .map((String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ))
                      .toList(),
                  hint: const Text('Select Salary'),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    deleteUser(index);
                  },
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: addUser,
                child: const Text('Add User'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  var sum = calculateTotalSalary(userList);
                  showTotalSalarySnackbar(context, sum);
                },
                child: const Text('Total salary'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class User {
  String name;
  String? selectedSalary;

  User({
    required this.name,
    this.selectedSalary,
  });
}
