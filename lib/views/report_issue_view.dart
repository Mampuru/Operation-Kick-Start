import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oks/contants.dart';
import 'package:oks/views/edit_profile_view.dart';
import 'package:oks/widgets/button_widget.dart';
import 'package:oks/widgets/textfield_widget.dart';
import 'package:intl/intl.dart';
import 'main_view.dart';

class ReportIssueView extends StatefulWidget {
  @override
  _ReportIssueViewState createState() => _ReportIssueViewState();
}

class _ReportIssueViewState extends State<ReportIssueView> {
  final issue = TextEditingController();
  File? image;
  var _formatted;

  final GeolocatorPlatform geolocator = GeolocatorPlatform.instance;
  late Position _currentPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Log Issue",style: TextStyle(color: Black,fontWeight: FontWeight.bold),),
        backgroundColor: White,
        leading: IconButton(icon: Icon(Icons.arrow_back_outlined,size:30,color: Black),onPressed: () => {
          Navigator.pop(context)
        },
        ),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(icon: Icon(Icons.account_circle,size:30,color: Black,),onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileView()));
          },)
        ),],
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
              color: Gray,
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              child: image != null ? Image.file(image!) : Icon(Icons.camera_alt,size: 50.0,)
            ),
          ),
        ),
        SizedBox(height: 10.0,),
        Padding(
          padding: const EdgeInsets.fromLTRB(16,0,16,0),
          child: TextFieldWidget(controller: issue, label: "Brief Description",),
        ),
        SizedBox(height: 50.0,),
        ButtonWidget(buttonName: "Log Issue",width: 320, onTap: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MainView()))
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

  getDate() async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat("yyyy-MM-dd hh:mm");
    final String formatted = formatter.format(now);
    setState(() {
      _formatted = formatted;
    });
  }

  determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    try {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      
      return position;
    } catch (e) {
      print(e);
    }
  }
}
