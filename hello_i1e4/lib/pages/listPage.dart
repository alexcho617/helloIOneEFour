// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:hello_i1e4/TeamMember.dart';
import 'package:hello_i1e4/service/member_service.dart';
import 'package:provider/provider.dart';
import 'detailPage.dart';
import 'newPage.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

class ListPage extends StatelessWidget {
  ListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MemberService>(builder: (context, memberService, child) {
      List<TeamMember> teamList = memberService.teamList;

      return Scaffold(
        appBar: AppBar(title: Text("E1A4")),
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
            return 
            Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (_) {
                // delete member
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
                title: Text(teamList[index].name),
                subtitle: Text(teamList[index].city),
                trailing: Text(teamList[index].mbti),
              ));
          },
        ),
      );
    });
  }
}
