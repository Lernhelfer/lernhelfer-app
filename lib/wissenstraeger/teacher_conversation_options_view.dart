import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TeacherConversationOptionsView extends StatefulWidget {
  @override
  _TeacherConversationOptionsViewState createState() =>
      _TeacherConversationOptionsViewState();
}

class _TeacherConversationOptionsViewState
    extends State<TeacherConversationOptionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher conversation options"),
      ),
      body: SafeArea(
        child: Center(
          child: Icon(FontAwesomeIcons.hardHat),
        ),
      ),
    );
  }
}
