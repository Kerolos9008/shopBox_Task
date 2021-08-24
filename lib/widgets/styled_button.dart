import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  double? width;
  Widget? child;
  void Function()? onPressed;
  bool loading;

  StyledButton({this.loading = false, this.width, this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: onPressed == null
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.grey,
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromRGBO(160, 92, 147, 1.0),
                  Color.fromRGBO(115, 82, 135, 1.0)
                ],
              )),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: loading ? null : onPressed,
            child: Center(
              child: loading
                  ?  Center(
                      child: SizedBox(
                        child: CircularProgressIndicator(
                          strokeWidth: 1.5,
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                        height: 13.0,
                        width: 13.0,
                      ),
                    )
                  : child,
            )),
      ),
    );
  }
}
