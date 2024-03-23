import 'package:flutter/material.dart';
import 'package:oks/contants.dart';
import 'package:oks/views/profile_info.dart';
import 'package:oks/widgets/button_widget.dart';

import '../widgets/textfield_widget.dart';
import 'main_view.dart';

class SignIn extends StatelessWidget {
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: White,
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40,),
                SizedBox(
                    height: 200, width: 200, child: Image.asset(LandingIconPath)),
                Text("Welcome to SB365",style: TextStyle(fontSize: 20),),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFieldWidget(controller: email, label: 'Email',),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFieldWidget(controller: password, label: 'Password',obscureText: true,),
                ),
                SizedBox(
                  height: 30.0,
                ),
                ButtonWidget(
                  buttonName: "Sign In",
                  buttonColor: White,
                  textColor: Black,
                  onTap: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainView()))
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    new Divider(
                      color: Colors.black,
                    ),
                    Text(
                      "OR",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                ButtonWidget(
                  buttonName: "Sign Up",
                  onTap: () => {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Center(child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold),)),
                          content: SizedBox(
                            width: 500,
                            child: SingleChildScrollView(
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
                            ),
                          ),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(120, 50), // Set minimum button size (width, height)
                                  ),
                                  child: Text('Cancel',style: TextStyle(color: Colors.red)),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Add your login logic here
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileInfo()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: PrimaryColor, // Set button color to red
                                    minimumSize: Size(120, 50), // Set minimum button size (width, height)
                                  ),
                                  child: Text('Sign Up',style: TextStyle(color: White),),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    )
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => ProfileInfo()))
                  },
                ),
                SizedBox(
                  height: 80.0,
                ),
                Text(
                  "App Version",
                  style: TextStyle(color: PrimaryColor, fontSize: 10.0),
                )
              ],
            ),
          ),
        ));
  }
}