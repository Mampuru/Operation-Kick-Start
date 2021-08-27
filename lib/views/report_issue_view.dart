
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oks/contants.dart';
import 'package:oks/views/issue_histroy_view.dart';
import 'package:oks/widgets/button_widget.dart';
import 'package:oks/widgets/textfield_widget.dart';

class ReportIssueView extends StatefulWidget {
  @override
  _ReportIssueViewState createState() => _ReportIssueViewState();
}

class _ReportIssueViewState extends State<ReportIssueView> {
  final issue = TextEditingController();
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log Issue"),
        backgroundColor: PrimaryColor,
        leading: IconButton(icon: Icon(Icons.arrow_back_outlined,size:30,color: Colors.white),onPressed: () => {
          Navigator.pop(context)
        },),
      ),
      body:SingleChildScrollView(child: buildContent(context)),
    );
  }

  Widget buildContent(context){
    return Column(
      children: [
        InkWell(
          onTap: () => {
            pickImage()
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: PrimaryColor,
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              child: image != null ? Image.file(image!) : Icon(Icons.camera_alt,size: 50.0,)
            ),
          ),
        ),
        SizedBox(height: 10.0,),
        Padding(
          padding: const EdgeInsets.fromLTRB(16,0,16,0),
          child: TextfieldWidget(controller: issue, label: "Brief Description",),
        ),
        SizedBox(height: 10.0,),
        ButtonWidget(buttonName: "Log Issue",width: 320, onTap: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) => IssueHistoryView()))
        })
      ],
    );
  }

  Future pickImage() async {
    try{
      final image  = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    }on PlatformException catch (e) {
      print("Failed to capture image: $e");
    }

  }
}
