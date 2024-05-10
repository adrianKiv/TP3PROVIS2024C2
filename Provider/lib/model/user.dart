class User {
  final String fullName;
  final String picture;
  final String location;
  final String registerDate;

  User({
    required this.fullName,
    required this.picture,
    required this.location,
    required this.registerDate,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final name = '${json['name']['title']} ${json['name']['first']} ${json['name']['last']}';
    final picture = json['picture']['large'];
    final location = '${json['location']['city']}, ${json['location']['country']}';
    final registerDate = json['registered']['date'];
    return User(
      fullName: name,
      picture: picture,
      location: location,
      registerDate: registerDate,
    );
  }
}
