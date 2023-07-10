// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("E1A4")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print("Navigate to NewPage Pressed");
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('CREATE LIST VEW'),
            OutlinedButton(
                onPressed: () {
                  print("Navigate to DetailPage");
                },
                child: Text("Go to detail"))
          ],
        ),
      ),
    );
  }
}
