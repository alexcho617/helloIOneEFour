//추가화면
import 'package:flutter/material.dart';

class newPage extends StatelessWidget {
  const newPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {
                  // btn pressed
                },
                child: Text("추가")),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 300,
            child: const Image(
              image: AssetImage('assets/images/user.png'),
            ),
            ),
          const Divider(),
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                newPageItem(hintText: "이름"),
                newPageItem(hintText: "MBTI"),
                newPageItem(hintText: "TMI"),
                newPageItem(hintText: "한마디"),
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

  newPageItem({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
        hintText: hintText),
        onChanged: (value) {
          // save
        },
        maxLines: 1,
      ),
    );
  }
}
