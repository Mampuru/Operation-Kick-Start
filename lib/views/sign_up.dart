import 'package:flutter/material.dart';

import '../widgets/textfield_widget.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TextFieldWidget(controller: name, label: 'Full Name',),
          SizedBox(height: 10,),
          TextFieldWidget(controller: email, label: 'Email',),
          SizedBox(height: 10,),
          TextFieldWidget(controller: password, label: 'Password',obscureText: true,),
          SizedBox(height: 10,),
          TextFieldWidget(controller: confirmPassword, label: 'Confirm Password',obscureText: true,),
        ],
      ),
    );
  }
}
