import 'package:flutter/material.dart';
import 'package:oks/views/main_view.dart';
import 'package:oks/widgets/button_widget.dart';
import 'package:oks/widgets/textfield_widget.dart';

import '../contants.dart';

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo>
    with SingleTickerProviderStateMixin {
  final street = TextEditingController();
  final suburb = TextEditingController();
  final city = TextEditingController();
  final province = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Start animation when the widget is first built
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      body: SingleChildScrollView(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.0),
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Residential Location",
                  style: TextStyle(color: Black, fontSize: TitleText),
                ),
                SizedBox(height: 40.0),
                buildAnimatedTextField(controller: street, label: "Street Name"),
                SizedBox(height: 10.0),
                buildAnimatedTextField(controller: suburb, label: "Suburb"),
                SizedBox(height: 10.0),
                buildAnimatedTextField(controller: city, label: "City"),
                SizedBox(height: 10.0),
                buildAnimatedTextField(controller: province, label: "Province"),
                SizedBox(height: 50.0),
                ButtonWidget(
                  buttonName: "Save",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainView()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAnimatedTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 0.5),
          end: Offset.zero,
        ).animate(_animationController),
        child: TextFieldWidget(controller: controller, label: label),
      ),
    );
  }
}
