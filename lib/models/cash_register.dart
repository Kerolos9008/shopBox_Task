class CashRegister {
  final int crId;
  final String name;

  CashRegister(
    this.crId,
    this.name,
  );

  factory CashRegister.fromJson(json) {
    return CashRegister(
      json['uid'],
      json['name'] ?? "",
    );
  }
}
