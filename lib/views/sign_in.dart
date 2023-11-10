
import 'package:flutter/material.dart';
import 'package:oks/contants.dart';
import 'package:oks/views/profile_info.dart';
import 'package:oks/widgets/button_widget.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height:250,width: 200,child: Image.asset(LandingIconPath)),
              SizedBox(height: 40.0,),
              ButtonWidget(buttonName: "Log in with Google",buttonColor: White,textColor: Black,onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileInfo()))
              },),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  new Divider(
                    color: Colors.black,
                  ),
                  Text("OR",style: TextStyle(color: Colors.grey),),
                  const Divider(
                    color: Colors.grey,
                  ),
              ],),
              SizedBox(height: 10.0,),
              ButtonWidget(buttonName: "Sign up with Google",onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileInfo()))
              },),
              SizedBox(height: 100.0,),
              Text("App Version",style: TextStyle(color: PrimaryColor,fontSize: 10.0),)
            ],
          ),
        )
    );
  }
}
