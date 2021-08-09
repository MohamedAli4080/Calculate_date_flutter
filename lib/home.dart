import 'package:flutter/material.dart';

class Home extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter the first  date",
                suffixIcon: Icon(Icons.calendar_today_rounded),
              ),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2019, 1),
                  lastDate: DateTime(2021, 12),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
