import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_i1e4/main.dart';
import 'package:hello_i1e4/teamMember.dart';

class MemberService extends ChangeNotifier {
  MemberService() {
    // load
  }
}

List<TeamMember> teamList = TeamMember.getDummyTeamMembers();

// save
saveMember() {
  List memberJson = teamList.map((member) => member.toJson()).toList();
  String jsonString = jsonEncode(memberJson);
  preferences.setString('memberList', jsonString);
}

// load
loadMember() {
  String? jsonString = preferences.getString('memberList');
  if (jsonString == null) return;
  List memeberJson = jsonDecode(jsonString);
  teamList = memeberJson.map((json) => TeamMember.fromJson(json)).toList();
}

// create member

// delete member

// update member