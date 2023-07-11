//상세화면
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import '../TeamMember.dart';


class DetailPage extends StatelessWidget {
  final TeamMember teamMember;

  DetailPage({required this.teamMember});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(teamMember.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${teamMember.name}'),
            Text('MBTI: ${teamMember.mbti}'),
            Text('City: ${teamMember.city}'),
            Text('Comment: ${teamMember.comment}'),
          ],
        ),
      ),
    );
  }
}
