import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/view_model.dart';
import 'package:rive/rive.dart';
import 'package:shopbox_task/models/user.dart';
import './login.repo.dart';
import 'package:shopbox_task/services/toastService.dart';
import './teddy_controller.dart';

class LoginViewModel extends ViewModel {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TeddyController _teddyController;
  LoginRepo _repo = LoginRepo();
  bool _loading = false;
  String _email = "";
  String _password = "";

  bool get loading => _loading;

  @override
  void init() {
    // TODO: implement init
    _teddyController = TeddyController();
    super.init();
  }

  void Function(Artboard) onRiveInit() {
    return _teddyController.onRiveInit;
  }

  void check() {
    _teddyController.startChecking();
  }

  void stopChecking() {
    _teddyController.startChecking();
  }

  void success() {
    _teddyController.success();
  }

  void fail() {
    _teddyController.fail();
  }

  void handsUp() {
    _teddyController.handsUp();
  }

  void handsDown() {
    _teddyController.handsDown();
  }

  void lookTo(String? value) {
    double _location = 0;
    if (value != null) _location = (value.length * 1.8);
    _teddyController.lookTo(_location);
  }

  void signin() async {
    stopChecking();
    handsDown();
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      _loading = true;
      notifyListeners();
      try {
        Response response = await _repo.login(_email, _password);
        if (response.statusCode == 201) {
          success();
          User.fromJson(response.data['account']);
          await _repo.saveToken(response.data['accessToken']);
          Future.delayed(Duration(milliseconds: 500,),() {
            Navigator.pushNamedAndRemoveUntil(context, '/clients', (route) => false);
          });
        } else {
          fail();
        }
      } on DioError catch (error) {
        fail();
        ToastService.showErrorToast(error.response?.data['error']['message']);
      }
      _loading = false;
      notifyListeners();
    }
  }

  void saveEmail(String? value) {
    _email = value!;
  }

  void savePassword(String? value) {
    _password = value!;
  }
}
