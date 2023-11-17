import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final userIcon;
  final issueImage;
  final title;
  final timeLogged;
  final description;
  const CardWidget({Key? key, this.userIcon, this.issueImage, this.title, this.timeLogged, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.asset(userIcon)),
                Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                Text(timeLogged),
              ],
            ),
            SizedBox(
                height: 150,
                width: 250,
                child: Image.asset(issueImage)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(description),
            ),
          ],
        ),
      ),
    );
  }
}
