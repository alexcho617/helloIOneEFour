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
      pic: "https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F29f71d45-25ca-4a02-b485-5c7a7b9e30c4%2FProfile.jpg?id=087db470-de81-40eb-b30f-557e4a049397&table=block&spaceId=ac8a63d0-0c71-47cc-9597-993a572151f6&width=580&userId=bbe527ed-7156-4022-bfdd-cad34f86ea87&cache=v2",
    ),
    TeamMember(
      name: "민지원",
      mbti: "ESTJ",
      city: "인천광역시 연수구",
      comment: "집에 술장고 보유 중 ㅎㅎ,,",
      pic: "https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fbddc1f37-6872-4cba-b5ea-5d537c3d98b1%2FIMG_2290.jpeg?id=18a3849d-9a9f-432b-880a-ef76c68bdb4e&table=block&spaceId=ac8a63d0-0c71-47cc-9597-993a572151f6&width=480&userId=bbe527ed-7156-4022-bfdd-cad34f86ea87&cache=v2",
    ),
    TeamMember(
      name: "박찬우",
      mbti: "INFP",
      city: "경기도 구리시",
      comment: "엄청난 집돌이",
      pic: "https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fd88f0943-567e-4eb1-a37d-3745218082c1%2F51CD43C2-2323-4CB1-9850-DEE352DFDF0A_1_105_c.jpeg?id=2bb7117c-5d10-498e-a42e-688a9f789aa8&table=block&spaceId=ac8a63d0-0c71-47cc-9597-993a572151f6&width=480&userId=bbe527ed-7156-4022-bfdd-cad34f86ea87&cache=v2",
    ),
    TeamMember(
      name: "조성진",
      mbti: "ESTJ",
      city: "서울특별시 양천구",
      comment: "사과 주주입니다. APPL 가즈아!",
      pic: "https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F6471d365-6d4c-4740-8745-e7b041406254%2FUntitled.png?id=e682f43c-a971-490c-a439-5eea5cef0e22&table=block&spaceId=ac8a63d0-0c71-47cc-9597-993a572151f6&width=580&userId=bbe527ed-7156-4022-bfdd-cad34f86ea87&cache=v2",
    ),
    TeamMember(
      name: "최진훈",
      mbti: "ENFP",
      city: "경기도 의정부시",
      comment: "11년차 맨시티 팬입니다",
      pic: "https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F51554acc-5bd6-423d-bf72-3836ef094677%2FKakaoTalk_Image_2023-07-10-12-28-43.jpeg?id=fe099407-4a8a-4817-a1a2-5bfadf85f037&table=block&spaceId=ac8a63d0-0c71-47cc-9597-993a572151f6&width=770&userId=bbe527ed-7156-4022-bfdd-cad34f86ea87&cache=v2",
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
    print(preferences.getString('memberList'));
  }

  // Update members
  updateMember({required int index, required String name, required String mbti, required String city, required String comment}) {
    TeamMember member = teamList[index];
    member.name = name;
    member.mbti = mbti;
    member.city = city;
    member.comment = comment;
    saveMembers(); // Save the updated list
    notifyListeners(); // Notify listeners of the change
    }
    
// create member
  createMember({required TeamMember newMember}) {
    teamList.add(newMember);
    saveMembers();
    notifyListeners();
  }

// delete member
  deleteMember({required int index}) {
    teamList.removeAt(index);
    saveMembers();
    notifyListeners();
  }
  
  // cancel delete member
  canceldelete({required int tempIndex, required TeamMember tempMember}) {
    teamList.insert(tempIndex, tempMember);
    saveMembers();
    notifyListeners();
  }
}