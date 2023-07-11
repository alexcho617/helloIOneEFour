// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import '../teamMember.dart';
import 'detailPage.dart';

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
        // 서브타이틀로 "안녕하세요, 저희는 I가 한명, E가 네 명인 I1E4 입니다!를 넣으면 어떨지
        backgroundColor: Colors.grey,
        toolbarHeight: 200,
      ),
      body: ListView.separated(
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
              title: Text(
                teamMembers[index].name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle:
                  Text(teamMembers[index].mbti, style: TextStyle(fontSize: 12)),
              leading: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.grey[500],
                    size: 55,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }
}
