//상세화면
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import '../teamMember.dart';

class DetailPage extends StatefulWidget {
  final TeamMember teamMember;

  DetailPage({required this.teamMember});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.teamMember.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${widget.teamMember.name}'),
            Text('MBTI: ${widget.teamMember.mbti}'),
            Text('City: ${widget.teamMember.city}'),
            Text('Fun Fact: ${widget.teamMember.funFact}'),
          ],
        ),
      ),
    );
  }
}
