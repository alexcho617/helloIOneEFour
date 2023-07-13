import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hello_i1e4/pages/detailPage.dart';
import 'package:hello_i1e4/service/member_service.dart';
import 'package:provider/provider.dart';
import '../TeamMember.dart';
import 'newPage.dart';

class ListPage extends StatelessWidget {
  ListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MemberService>(
      builder: (context, memberService, child) {
        List<TeamMember> teamList = memberService.teamList;

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
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => newPage(),
                ),
              );
            },
          ),
          body: ListView.builder(
            itemCount: teamList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  memberService.deleteMember(index: index);
                },
                background: Container(
                  color: Colors.red,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: ListTile(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(
                          index: index,
                        ),
                      ),
                    );
                  },
                  visualDensity: VisualDensity(horizontal: 4, vertical: 4),
                  title: Text(
                    teamList[index].name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  subtitle: Text(teamList[index].mbti,
                      style: TextStyle(fontSize: 16)),
                  leading: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.grey[500],
                        size: 60,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
