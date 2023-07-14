import 'package:flutter/material.dart';
import 'package:hello_i1e4/pages/detailPage.dart';
import 'package:hello_i1e4/service/member_service.dart';
import 'package:provider/provider.dart';
import '../TeamMember.dart';
import 'newPage.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MemberService>(
      builder: (context, memberService, child) {
        List<TeamMember> teamList = memberService.teamList;
        return Scaffold(
          appBar: AppBar(
            title: Column(
              children: [
                Text(
                  "I1E4",
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "안녕하세요? 저희는 I가 한명, E가 네 명인 I1E4 입니다!",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            backgroundColor: Color.fromARGB(255, 144, 203, 250),
            toolbarHeight: 200,
          ),
          body: ListView.builder(
            itemCount: teamList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text("정말 삭제하시겠습니까?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              memberService.deleteMember(index: index);
                              Navigator.of(context).pop();
                            },
                            child: Text("확인"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("취소"),
                          ),
                        ],
                      );
                    },
                  );
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 144, 203, 250)),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      subtitle: Text(teamList[index].mbti,
                          style: TextStyle(fontSize: 16)),
                      leading: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            // Image
                            child: memberService.teamList[index].pic != ''
                                ? Image.network(
                                    memberService.teamList[index].pic)
                                : Icon(
                                    Icons.person,
                                    color: Colors.grey[500],
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
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
        );
      },
    );
  }
}
