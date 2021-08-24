import 'package:rive/rive.dart';

class TeddyController {
  late SMITrigger _success;
  late SMITrigger _fail;
  late SMIBool _check;
  late SMIBool _handsUp;
  late SMINumber _look;

  void onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    _success = controller.findInput<bool>('success') as SMITrigger;
    _fail = controller.findInput<bool>('fail') as SMITrigger;
    _check = controller.findInput<bool>('Check') as SMIBool;
    _handsUp = controller.findInput<bool>('hands_up') as SMIBool;
    _look = controller.findInput<double>('Look') as SMINumber;
  }

  void success() {
    _success.fire();
  }

  void fail() {
    _fail.fire();
  }

  void handsUp() {
    _handsUp.change(true);
  }

  void handsDown() {
    _handsUp.change(false);
  }

  void startChecking() {
    _check.change(true);
  }

  void stopChecking() {
    _check.change(false);
  }

  void lookTo(double n) {
    _look.change(n);
  }
}
