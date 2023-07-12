import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hello_i1e4/main.dart';
import 'package:hello_i1e4/TeamMember.dart';

class MemberService extends ChangeNotifier {
  MemberService() {
    // load
    // loadMember();
  }

  List<TeamMember> teamList = [
    TeamMember(
      name: "홍길동",
      mbti: "ISTJ",
      city: "서울",
      comment: "커피를 마시면 에너지가 넘칩니다.",
      pic: "",
    ),
    TeamMember(
      name: "김영희",
      mbti: "ENFP",
      city: "부산",
      comment: "노래를 잘 부릅니다.",
      pic: "",
    ),
    TeamMember(
      name: "박철수",
      mbti: "ESTJ",
      city: "대구",
      comment: "요리를 하는 것을 즐깁니다.",
      pic: "",
    ),
    TeamMember(
      name: "이미영",
      mbti: "INTP",
      city: "인천",
      comment: "여행을 좋아합니다.",
      pic: "",
    ),
    TeamMember(
      name: "최민식",
      mbti: "ISFP",
      city: "대전",
      comment: "악기 연주를 잘합니다.",
      pic: "",
    ),
  ];

  // Save members
  void saveMembers() {
    List memberJson = teamList.map((member) => member.toJson()).toList();
    String jsonString = jsonEncode(memberJson);
    preferences.setString('memberList', jsonString);
  }

  // Load members
  void loadMembers() {
    String? jsonString = preferences.getString('memberList');
    if (jsonString == null) return;
    List memberJson = jsonDecode(jsonString);
    teamList = memberJson.map((json) => TeamMember.fromJson(json)).toList();
  }

  // Update members
  void updateMember(TeamMember updatedMember) {
    int index =
        teamList.indexWhere((member) => member.name == updatedMember.name);
    if (index != -1) {
      teamList[index] = updatedMember;
      saveMembers(); // Save the updated list
      notifyListeners(); // Notify listeners of the change
    }
  }
}
