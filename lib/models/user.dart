class User {
  int? uid;
  String? username;
  String? firstName;
  String? middleName;
  String? lastName;
  String? mobile;
  String? title;
  String? code;
  String? lang;

  User._({
    this.uid,
    this.username,
    this.firstName,
    this.middleName,
    this.lastName,
    this.mobile,
    this.title,
    this.code,
    this.lang,
  });

  factory User() {
    if (_this == null) _this = User._();
    return _this!;
  }

  factory User.fromJson(json) {
    if (_this == null) {
      _this = User._(
        uid: json['uid'],
        username: json['username'],
        firstName: json['first_name'],
        middleName: json['middle_name'],
        lastName: json['last_name'],
        mobile: json['mobile'],
        title: json['title'],
        code: json['code'],
        lang: json['lang'],
      );
    } else {
      _this = User._(
        uid: json['uid'],
        username: json['username'],
        firstName: json['first_name'],
        middleName: json['middle_name'],
        lastName: json['last_name'],
        mobile: json['mobile'],
        title: json['title'],
        code: json['code'],
        lang: json['lang'],
      );
    }
    return _this!;
  }

  static User? _this;
}
