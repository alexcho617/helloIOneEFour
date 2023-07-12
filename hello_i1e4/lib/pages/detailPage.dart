import 'package:flutter/material.dart';
import '../TeamMember.dart';

class DetailPage extends StatefulWidget {
  final TeamMember teamMember;

  DetailPage({required this.teamMember});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mbtiController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _funFactController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize values based on the team member object
    _nameController.text = widget.teamMember.name;
    _mbtiController.text = widget.teamMember.mbti;
    _cityController.text = widget.teamMember.city;
    _funFactController.text = widget.teamMember.comment;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mbtiController.dispose();
    _cityController.dispose();
    _funFactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.teamMember.name),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _showEditDialog();
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
                  child: Image.network(
                    'https://i.namu.wiki/i/d1A_wD4kuLHmOOFqJdVlOXVt1TWA9NfNt_HA0CS0Y_N0zayUAX8olMuv7odG2FiDLDQZIRBqbPQwBSArXfEJlQ.webp',
                  ),
                  // 그림 넣을경우 사용
                ),
              ),
              //한번에 패딩안에 넣는 방법을 찾다가 실패...
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: _buildDetailRow('Name', _nameController.text),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: _buildDetailRow('MBTI', _mbtiController.text),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: _buildDetailRow('City', _cityController.text),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: _buildDetailRow('Fun Fact', _funFactController.text),
              ),
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

  void _showEditDialog() {
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
              _buildEditField('Fun Fact', _funFactController),
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
                String newName = _nameController.text;
                String newMbti = _mbtiController.text;
                String newCity = _cityController.text;
                String newFunFact = _funFactController.text;
                // Update the values with the new ones
                setState(() {
                  widget.teamMember.name = newName;
                  widget.teamMember.mbti = newMbti;
                  widget.teamMember.city = newCity;
                  widget.teamMember.comment = newFunFact;
                });
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
