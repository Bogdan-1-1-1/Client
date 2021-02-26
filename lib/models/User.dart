class User {
  String id;
  String name;
  String gender;
  String birthDate;
  List<String> interests;

  User({this.id, this.name, this.gender, this.birthDate, this.interests});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['_id'] as String,
        name: json['name'] as String,
        gender: json['gender'] as String,
        birthDate: json['birthDate'] as String,
        interests: json['interests'].cast<String>());
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'gender': gender,
      'birthDate': birthDate,
      'interests': interests
    };
  }

  User copyWith({
    String id,
    String name,
    String gender,
    String birthDate,
    List<String> interests,
  }) {
    return User(
        id: id ?? this.id,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
        interests: interests ?? this.interests);
  }

  @override
  String toString() => '''
  id: $id, 
  name: $name, 
  gender: $gender,
  birthDate: $birthDate,
  interests: $interests,  
  ''';
}
