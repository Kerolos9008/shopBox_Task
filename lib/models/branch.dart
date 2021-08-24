import 'package:shopbox_task/models/address.dart';
import 'package:shopbox_task/models/cash_register.dart';

class Branch {
  final int branchId;
  final String name;
  final String phone;
  final Address address;
  List<CashRegister> crs = [];

  Branch(
    this.branchId,
    this.name,
    this.phone,
    this.address,
    this.crs,
  );

  factory Branch.fromJson(json) {
    final Iterable _crs = json['cash_registers'];
    List<CashRegister> _crList =
        _crs.map((e) => CashRegister.fromJson(e)).toList();
    return Branch(
      json['uid'],
      json['name'] ?? "",
      json['phone'] ?? "",
      Address.fromJson(json['address0']),
      _crList,
    );
  }
}
