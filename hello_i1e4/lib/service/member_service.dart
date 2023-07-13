import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hello_i1e4/main.dart';
import 'package:hello_i1e4/TeamMember.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemberService extends ChangeNotifier {
  MemberService() {
    loadMembers();
  }

  List<TeamMember> teamList = [
    TeamMember(
      name: "김도연",
      mbti: "ESTJ",
      city: "강원도 원주시",
      comment: "반숙도 완숙도 싫어요~ 3/4숙 란으로 달걀을 익혀 먹어요, 몸치인데 발레가 취미에요ㅎㅎ",
      pic: "",
    ),
    TeamMember(
      name: "민지원",
      mbti: "ESTJ",
      city: "인천광역시 연수구",
      comment: "집에 술장고 보유 중 ㅎㅎ,,",
      pic: "",
    ),
    TeamMember(
      name: "박찬우",
      mbti: "INFP",
      city: "경기도 구리시",
      comment: "엄청난 집돌이",
      pic: "",
    ),
    TeamMember(
      name: "조성진",
      mbti: "ESTJ",
      city: "서울특별시 양천구",
      comment: "사과 주주입니다. APPL 가즈아!",
      pic: "",
    ),
    TeamMember(
      name: "최진훈",
      mbti: "ENFP",
      city: "경기도 의정부시",
      comment: "11년차 맨시티 팬입니다",
      pic: "",
    ),
  ];

  // Save members
  saveMembers() {
    List memberJson = teamList.map((member) => member.toJson()).toList();
    String jsonString = jsonEncode(memberJson);
    preferences.setString('memberList', jsonString);
  }

  // Load members
  loadMembers() {
    String? jsonString = preferences.getString('memberList');
    if (jsonString == null) return;
    List memberJson = jsonDecode(jsonString);
    teamList = memberJson.map((json) => TeamMember.fromJson(json)).toList();
  }

  // Update members
  updateMember(
      {required int index,
      required String name,
      required String mbti,
      required String city,
      required String comment}) {
    teamList[index].name = name;
    teamList[index].mbti = mbti;
    teamList[index].city = city;
    teamList[index].comment = comment;
    saveMembers(); // Save the updated list
    notifyListeners(); // Notify listeners of the change
  }

// create member
  createMember({required TeamMember newMember}) {
    teamList.insert(0, newMember);
    saveMembers();
    notifyListeners();
  }

// delete member
  deleteMember({required int index}) {
    teamList.removeAt(index);
    saveMembers();
    notifyListeners();
  }
}
