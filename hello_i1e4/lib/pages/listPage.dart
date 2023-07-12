import 'package:flutter/material.dart';
import 'package:hello_i1e4/TeamMember.dart';
import 'package:hello_i1e4/pages/detailPage.dart';
import 'package:hello_i1e4/service/member_service.dart';
import 'package:provider/provider.dart';
import 'newPage.dart';

class ListPage extends StatelessWidget {
  ListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MemberService>(builder: (context, memberService, child) {
      List<TeamMember> teamList = memberService.teamList;

      return Scaffold(
        appBar: AppBar(
          title: Text("E1A4"),
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
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(teamMember: teamList[index],
                      ),
                      ),
                      );
                },
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
