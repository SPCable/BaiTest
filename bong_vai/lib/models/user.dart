import 'dart:convert';

class User {
  Name name;
  Picture picture;
  String email;
  String phone;
  User({
    this.name,
    this.picture,
    this.email,
    this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name.toMap(),
      'picture': picture.toMap(),
      'email': email,
      'phone': phone,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: Name.fromMap(map['name']),
      picture: Picture.fromMap(map['picture']),
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(name: $name, picture: $picture, email: $email, phone: $phone)';
  }
}

class Name {
  String last;
  String first;
  Name({
    this.last,
    this.first,
  });

  Map<String, dynamic> toMap() {
    return {
      'last': last,
      'first': first,
    };
  }

  factory Name.fromMap(Map<String, dynamic> map) {
    return Name(
      last: map['last'] ?? '',
      first: map['first'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Name.fromJson(String source) => Name.fromMap(json.decode(source));
}

class Picture {
  String medium;
  Picture({
    this.medium,
  });

  Map<String, dynamic> toMap() {
    return {
      'medium': medium,
    };
  }

  factory Picture.fromMap(Map<String, dynamic> map) {
    return Picture(
      medium: map['large'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Picture.fromJson(String source) =>
      Picture.fromMap(json.decode(source));
}
