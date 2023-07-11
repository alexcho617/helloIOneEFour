import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class newPage extends StatefulWidget {
  const newPage({super.key});

  @override
  State<newPage> createState() => _newPageState();
}

class _newPageState extends State<newPage> {
  @override
  Widget build(BuildContext context) {

  XFile? photo_file;
  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource imageSource) async {
      final XFile? pickedFile = await picker.pickImage(source: imageSource);
      if (pickedFile != null) {
        setState(() {
          photo_file = XFile(pickedFile.path);
          // print(photo_file?.path);
        });
      }
  }

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
            child: GestureDetector(
              onTap: () {
                getImage(ImageSource.gallery);
              },
              child: 
              photo_file != null 
              ? Image.file(File(photo_file!.path))
              : const Image(image: AssetImage('assets/images/user.png')),
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
        decoration: InputDecoration(hintText: hintText),
        onChanged: (value) {
          // save
        },
        maxLines: 1,
      ),
    );
  }
}
