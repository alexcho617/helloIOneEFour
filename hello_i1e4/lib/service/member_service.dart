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

  setChange() {
    notifyListeners();
  }

// create member

// delete member

// update member

}
