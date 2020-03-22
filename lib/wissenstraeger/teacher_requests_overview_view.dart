import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lernhelfer/navigation/routes.dart';

class TeacherRequestsOverviewView extends StatefulWidget {
  @override
  _TeacherRequestsOverviewViewState createState() =>
      _TeacherRequestsOverviewViewState();
}

class _TeacherRequestsOverviewViewState
    extends State<TeacherRequestsOverviewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hilfsanfragen"),
      ),
      body: SafeArea(
        child: Stack(children: <Widget>[
          Center(
            child: Icon(FontAwesomeIcons.hardHat),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                Routes.teacherConversationOptions,
              ),
              child: Text("Weiter gehts"),
            ),
          )
        ]),
      ),
    );
  }
}
