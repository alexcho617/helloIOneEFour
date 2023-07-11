class TeamMember {
  String name;
  String mbti;
  String city;
  String comment;
  String pic;

  TeamMember({
    required this.name,
    required this.mbti,
    required this.city,
    required this.comment,
    required this.pic,
  });

  Map toJson() {
    return {
      'name': name,
      'mbti': mbti,
      'citiy': city,
      'comment': comment,
      'pic': pic
    };
  }

  factory TeamMember.fromJson(json) {
    return TeamMember(
      name: json['name'],
      mbti: json['mbti'],
      city: json['city'],
      comment: json['comment'],
      pic: json['pic']
    );
  }
}
