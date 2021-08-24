import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:rive/rive.dart' as rive;
import 'package:shopbox_task/configurations/validators.dart';
import './login.viewModel.dart';
import 'package:shopbox_task/widgets/styled_button.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (context, viewModel) => LoginView(),
      viewModel: LoginViewModel(),
    );
  }
}

class LoginView extends HookView<LoginViewModel> {
  @override
  Widget render(BuildContext context, LoginViewModel viewModel) {
    // TODO: implement render
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
          viewModel.stopChecking();
          viewModel.handsDown();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                child: rive.RiveAnimation.asset(
                  "assets/images/teddy.riv",
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.contain,
                  onInit: viewModel.onRiveInit(),
                  stateMachines: ['State Machine 1'],
                  animations: ['Idle'],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25.0))),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "example@example.com",
                              labelText: "Email",
                            ),
                            validator: Validators.validateEmail,
                            onTap: viewModel.check,
                            onChanged: viewModel.lookTo,
                            onSaved: viewModel.saveEmail,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Password",
                              labelText: "Password",
                            ),
                            obscureText: true,
                            validator: Validators.validatePassword,
                            onTap: viewModel.handsUp,
                            onSaved: viewModel.savePassword,
                          ),
                        ),
                        StyledButton(
                          loading: viewModel.loading,
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: viewModel.signin,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
