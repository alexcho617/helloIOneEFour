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
        title: ListTile(
          title: Text(
            "I1E4",
            style: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            "안녕하세요? 저희는 I가 한명, E가 네 명인 I1E4 입니다!",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        elevation: 1,
        child: Icon(
          Icons.add_circle,
          size: 36,
        ),
        onPressed: () {}, // 페이지 화면 전환(이동) 로직 필요
      ),
    );
  }
}
