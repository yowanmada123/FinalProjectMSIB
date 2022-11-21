// ignore_for_file: public_member_api_docs, sort_constructors_first
class Profile {
  final String name;
  final String email;
  final int id;
  final String handphone;
  Profile({
    required this.email,
    required this.name,
    required this.id,
    required this.handphone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'fullname': name,
      'id': id,
      'handphone': handphone,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      email: map['email'] as String,
      name: map['name'] as String,
      id: map['id'],
      handphone: map['handphone'] as String,
    );
  }

  @override
  String toString() {
    return 'Profile(email: $email, name: $name, , id: $id, handphone: $handphone, )';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.email == email && other.name == name  && other.id == id && other.handphone == handphone;
  }
}
