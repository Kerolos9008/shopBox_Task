import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pmvvm/view_model.dart';
import 'package:shopbox_task/models/branch.dart';
import 'package:shopbox_task/models/cash_register.dart';
import 'package:shopbox_task/pages/branchesPage/branches.repo.dart';

class BranchesViewModel extends ViewModel{

  final String _clientId;
  BranchesViewModel(this._clientId);

  BranchesRepo _repo = BranchesRepo();

  List<Branch> _branchesList = [];
  int? _selectedCrId;

  int? get selectedCrId => _selectedCrId;
  List<Branch> get branchesList => _branchesList;

  @override
  void init() {
    // TODO: implement init
    EasyLoading.show();
    _repo.getBranches(_clientId).then((response) {
      final Iterable branches = response.data['data'];
      _branchesList = branches.map((e) => Branch.fromJson(e)).toList();
      notifyListeners();
      EasyLoading.dismiss();
    });
    super.init();
  }

  void selectCR(int? _cr){
    _selectedCrId = _cr;
    notifyListeners();
  }

  void next(){
    Navigator.pushNamed(context, '/products/$_clientId/$_selectedCrId');
  }
}