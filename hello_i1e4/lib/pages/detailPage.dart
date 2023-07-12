import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/member_service.dart';

class DetailPage extends StatefulWidget {
  final int index;

  DetailPage({required this.index});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mbtiController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    MemberService memberService = context.read<MemberService>();

    _nameController.text = memberService.teamList[widget.index].name;
    _mbtiController.text = memberService.teamList[widget.index].mbti;
    _cityController.text = memberService.teamList[widget.index].city;
    _commentController.text = memberService.teamList[widget.index].comment;

    return Scaffold(
      appBar: AppBar(
        title: Text(memberService.teamList[widget.index].name),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              showEditDialog(service: memberService, index: widget.index);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: memberService.teamList[widget.index].pic != ''
                      ? Image.file(
                          File(memberService.teamList[widget.index].pic))
                      : const Image(
                          image: AssetImage('assets/images/user.png')),
                  // 그림 넣을경우 사용
                ),
              ),
              //한번에 패딩안에 넣는 방법을 찾다가 실패...
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    _buildDetailRow('Name', _nameController.text),
                    Divider(),
                    _buildDetailRow('MBTI', _mbtiController.text),
                    Divider(),
                    _buildDetailRow('City', _cityController.text),
                    Divider(),
                    _buildDetailRow('Comment', _commentController.text),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '$label: $value',
          style: TextStyle(
            fontSize: 22,
            color: Colors.blue[300],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  showEditDialog({required MemberService service, required int index}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Member'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildEditField('Name', _nameController),
              _buildEditField('MBTI', _mbtiController),
              _buildEditField('City', _cityController),
              _buildEditField('Comment', _commentController),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                // update로 변경 예정
                service.teamList[widget.index].name = _nameController.text;
                service.teamList[widget.index].mbti = _mbtiController.text;
                service.teamList[widget.index].city = _cityController.text;
                service.teamList[widget.index].comment =_commentController.text;
                service.setChange();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildEditField(String label, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}
