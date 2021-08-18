
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
              Image.asset(LogoPath),
              SizedBox(height: 40.0,),
              ButtonWidget(buttonName: "Gmail",onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileInfo()))
              },),
              SizedBox(height: 10.0,),
              ButtonWidget(buttonName: "Phone number",onTap: () => {
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
