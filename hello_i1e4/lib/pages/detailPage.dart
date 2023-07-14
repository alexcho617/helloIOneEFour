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
  MemberService memberService = MemberService();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _mbtiController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    memberService = context.watch<MemberService>();

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
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 300,
                    // Image
                    child: memberService.teamList[widget.index].pic != ''
                        ? Image.network(memberService.teamList[widget.index].pic)
                        : const Image(
                            image: AssetImage('assets/images/user.png')),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    _buildDetailRow(
                        'Name', memberService.teamList[widget.index].name),
                    Divider(
                      color: Color.fromARGB(255, 144, 203, 250),
                    ),
                    _buildDetailRow(
                        'MBTI', memberService.teamList[widget.index].mbti),
                    Divider(
                      color: Color.fromARGB(255, 144, 203, 250),
                    ),
                    _buildDetailRow(
                        'City', memberService.teamList[widget.index].city),
                    Divider(
                      color: Color.fromARGB(255, 144, 203, 250),
                    ),
                    _buildDetailRow('Comment',
                        memberService.teamList[widget.index].comment),
                    Divider(
                      color: Color.fromARGB(255, 144, 203, 250),
                    ),
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
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildEditField('Name', _nameController),
                _buildEditField('MBTI', _mbtiController),
                _buildEditField('City', _cityController),
                _buildEditField('Comment', _commentController),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                 _nameController.text = memberService.teamList[index].name;
                _mbtiController.text = memberService.teamList[index].mbti;
                _cityController.text = memberService.teamList[index].city;
                _commentController.text = memberService.teamList[index].comment;
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                service.updateMember(
                    index: index,
                    name: _nameController.text,
                    mbti: _mbtiController.text,
                    city: _cityController.text,
                    comment: _commentController.text);
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
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}
