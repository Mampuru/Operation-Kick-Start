import 'package:flutter/material.dart';
import 'package:oks/contants.dart';
import 'package:oks/views/main_view.dart';
import 'package:oks/widgets/button_widget.dart';
import 'package:oks/widgets/textfield_widget.dart';

class ProfileInfo extends StatelessWidget {
  final street = TextEditingController();
  final suburb = TextEditingController();
  final city = TextEditingController();
  final province = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: White,
        body: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Residential Location",style: TextStyle(color: Black,fontSize: TitleText),),
                SizedBox(height: 40.0,),
                ButtonWidget(buttonName: "Use Current Location",buttonColor: White,textColor: Black, onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainView()))
                }),
                SizedBox(height: 10.0,),
                Text('OR'),
                SizedBox(height: 10.0,),
                TextFieldWidget(controller: street, label: "Street Name"),
                SizedBox(height: 10.0,),
                TextFieldWidget(controller: suburb, label: "Suburb"),
                SizedBox(height: 10.0,),
                TextFieldWidget(controller: city, label: "City"),
                SizedBox(height: 10.0,),
                TextFieldWidget(controller: province, label: "Province"),
                SizedBox(height: 50.0,),
                ButtonWidget(buttonName: "Save", onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainView()))
                })
              ],
            ),
          ),
        )
    );
  }
}
