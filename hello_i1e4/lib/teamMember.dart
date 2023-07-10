class TeamMember {
  String name;
  String mbti;
  String city;
  String funFact;

  TeamMember({
    required this.name,
    required this.mbti,
    required this.city,
    required this.funFact,
  });

  static List<TeamMember> getDummyTeamMembers() {
    return [
      TeamMember(
        name: "홍길동",
        mbti: "ISTJ",
        city: "서울",
        funFact: "커피를 마시면 에너지가 넘칩니다.",
      ),
      TeamMember(
        name: "김영희",
        mbti: "ENFP",
        city: "부산",
        funFact: "노래를 잘 부릅니다.",
      ),
      TeamMember(
        name: "박철수",
        mbti: "ESTJ",
        city: "대구",
        funFact: "요리를 하는 것을 즐깁니다.",
      ),
      TeamMember(
        name: "이미영",
        mbti: "INTP",
        city: "인천",
        funFact: "여행을 좋아합니다.",
      ),
      TeamMember(
        name: "최민식",
        mbti: "ISFP",
        city: "대전",
        funFact: "악기 연주를 잘합니다.",
      ),
    ];
  }
}
