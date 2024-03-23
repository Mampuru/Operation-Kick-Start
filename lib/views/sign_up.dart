import 'package:flutter/material.dart';

import '../contants.dart';
import '../widgets/button_widget.dart';
import '../widgets/textfield_widget.dart';
import 'main_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10.0),
              Text(
                "Welcome to SB365",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Please Sign Up",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              TextFieldWidget(
                controller: name,
                label: 'Full Name',
              ),
              SizedBox(height: 20.0),
              TextFieldWidget(
                controller: email,
                label: 'Email',
              ),
              SizedBox(height: 20.0),
              TextFieldWidget(
                controller: password,
                label: 'Password',
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              TextFieldWidget(
                controller: confirmPassword,
                label: 'Confirm Password',
                obscureText: true,
              ),
              SizedBox(
                height: 30.0,
              ),
              ButtonWidget(
                buttonName: "Sign Up",
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainView()),
                  )
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
