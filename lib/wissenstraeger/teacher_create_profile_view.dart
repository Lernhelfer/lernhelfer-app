import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lernhelfer/generated/l10n.dart';
import 'package:lernhelfer/navigation/routes.dart';

class TeacherCreateProfileView extends StatefulWidget {
  @override
  _TeacherCreateProfileViewState createState() =>
      _TeacherCreateProfileViewState();
}

class _TeacherCreateProfileViewState extends State<TeacherCreateProfileView> {
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( S.of(context).teacherCreateProfile),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: S.of(context).username,
                ),
              ),
              Center(
                child: _image == null
                    ? Image.asset('assets/placeholder.png')
                    : Image.file(_image),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: _pickImage,
                    child: Icon(Icons.add_a_photo),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  Routes.teacherSkills,
                ),
                child: Text(S.of(context).goOn),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
// file = await ImagePicker.pickImage(source: ImageSource.gallery);
  }
}
