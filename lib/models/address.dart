class Address {
  final String street;
  final String city;

  Address(
    this.street,
    this.city,
  );

  factory Address.fromJson(json) {
    return Address(
      json['street_name'] ?? "",
      json['city_name'] ?? "",
    );
  }
}
