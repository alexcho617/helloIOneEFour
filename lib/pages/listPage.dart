// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import '../teamMember.dart';
import 'detailPage.dart';
import 'newPage.dart';

class ListPage extends StatelessWidget {
  ListPage({Key? key});

  List<TeamMember> teamMembers = TeamMember.getDummyTeamMembers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "I1E4",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey,
        toolbarHeight: 200, // Set this height
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: teamMembers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigation logic to detail page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailPage(teamMember: teamMembers[index]),
                ),
              );
            },
            child: ListTile(
              title: Text(teamMembers[index].name),
              subtitle: Text(teamMembers[index].mbti),
            ),
          );
        },
      ),
    );
  }
}
