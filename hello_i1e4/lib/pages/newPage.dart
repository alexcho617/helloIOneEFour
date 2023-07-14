import 'package:flutter/material.dart';
import 'package:hello_i1e4/service/member_service.dart';
import 'package:provider/provider.dart';
import '../TeamMember.dart';

class newPage extends StatefulWidget {
  const newPage({
    super.key,
  });

  @override
  State<newPage> createState() => _newPageState();
}

class _newPageState extends State<newPage> {
  MemberService memberService = MemberService();
  var newMember =
      TeamMember(name: "", mbti: "", city: "", comment: "", pic: "");

  @override
  Widget build(BuildContext context) {
    memberService = context.read<MemberService>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              // save
              memberService.createMember(newMember: newMember);
              Navigator.of(context).pop();
            },
            child: Text("저장"),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 300,
            child: GestureDetector(
              child: Image(image: AssetImage('assets/images/user.png')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: const Divider(
              color: Color.fromARGB(255, 144, 203, 250),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                newPageItem(
                  hintText: "이름",
                  newMember: newMember,
                ),
                newPageItem(hintText: "MBTI", newMember: newMember),
                newPageItem(hintText: "지역", newMember: newMember),
                newPageItem(hintText: "한마디", newMember: newMember),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class newPageItem extends StatelessWidget {
  var hintText;
  TeamMember newMember;

  newPageItem({
    super.key,
    required this.hintText,
    required this.newMember,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 144, 203, 250),
            ),
          ),
        ),
        maxLines: 1,
        onChanged: (value) {
          switch (hintText) {
            case "이름":
              newMember.name = value;
            case "MBTI":
              newMember.mbti = value;
            case "지역":
              newMember.city = value;
            case "한마디":
              newMember.comment = value;
          }
        },
      ),
    );
  }
}
