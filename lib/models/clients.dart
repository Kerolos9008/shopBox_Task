class Client {
  final int uid;
  final String name;
  final String description;
  final String phone;

  Client(
    this.uid,
    this.name,
    this.description,
    this.phone,
  );

  factory Client.fromJson(json) {
    return Client(
      json['uid'],
      json['name'],
      json['description'],
      json['phone'],
    );
  }
}
