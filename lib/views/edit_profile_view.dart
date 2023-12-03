import 'package:flutter/material.dart';

import '../contants.dart';
import '../widgets/textfield_widget.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  get name => null;
  get email => null;
  get location => null;
  get password => null;

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
    final name = TextEditingController();
    final location = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Profile",style: TextStyle(color: Black,fontWeight: FontWeight.bold),),
        backgroundColor: White,
        leading: IconButton(icon: Icon(Icons.arrow_back_outlined,size:30,color: Black),onPressed: () => {
          Navigator.pop(context)
        },
        ),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.account_circle,size:30,color: Black,),
        ),],
      ),
      body:SingleChildScrollView(child: buildContent(context)),
    );
  }

  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(controller: name, label: 'Admin Admin',),
        TextFieldWidget(controller: email, label: 'admin@gmail.com',),
        TextFieldWidget(controller: location, label: '293 Dove Ave Cape Town',),
        TextFieldWidget(controller: password, label: 'rock_and_roll',obscureText: true,),
      ],
    );
  }
}
