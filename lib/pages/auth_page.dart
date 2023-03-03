import 'package:flutter/material.dart';

String name = "Flutter";

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var iconColor = Theme.of(context).hintColor;

    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("MonkeyApp",
                  style: TextStyle(color: primaryColor, fontSize: 30)),
              //Image.asset("images/monkey.png")
            ],
          ),
          const AuthorizationMargin(
            heightScale: 0.05,
          ),
          Authorization
        ]),
      )),
    );
  }
}
