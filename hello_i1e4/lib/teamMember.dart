class TeamMember {
  String name;
  String mbti;
  String city;
  String comment;

  TeamMember({
    required this.name,
    required this.mbti,
    required this.city,
    required this.comment,
  });

  static List<TeamMember> getDummyTeamMembers() {
    return [
      TeamMember(
        name: "홍길동",
        mbti: "ISTJ",
        city: "서울",
        comment: "커피를 마시면 에너지가 넘칩니다.",
      ),
      TeamMember(
        name: "김영희",
        mbti: "ENFP",
        city: "부산",
        comment: "노래를 잘 부릅니다.",
      ),
      TeamMember(
        name: "박철수",
        mbti: "ESTJ",
        city: "대구",
        comment: "요리를 하는 것을 즐깁니다.",
      ),
      TeamMember(
        name: "이미영",
        mbti: "INTP",
        city: "인천",
        comment: "여행을 좋아합니다.",
      ),
      TeamMember(
        name: "최민식",
        mbti: "ISFP",
        city: "대전",
        comment: "악기 연주를 잘합니다.",
      ),
    ];
  }

  Map toJson() {
    return {
      'name': name,
      'mbti': mbti,
      'citiy': city,
      'comment': comment
    };
  }

  factory TeamMember.fromJson(json) {
    return TeamMember(
      name: json['name'],
      mbti: json['mbti'],
      city: json['city'],
      comment: json['comment'],
      );
  }
}
