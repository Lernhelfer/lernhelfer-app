import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lernhelfer/generated/l10n.dart';
import 'package:lernhelfer/logic/learner_store.dart';
import 'package:lernhelfer/navigation/routes.dart';
import 'package:lernhelfer/widgets/custom_button_widget.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class LearnerLookingForHelpQuestionView extends StatefulWidget {
  @override
  _LearnerLookingForHelpQuestionView createState() =>
      _LearnerLookingForHelpQuestionView();
}

class _LearnerLookingForHelpQuestionView
    extends State<LearnerLookingForHelpQuestionView> {
  File _image;
  String _question;

  @override
  Widget build(BuildContext context) {
    var store = Injector.getAsReactive<LearnerStore>();

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).learnerQuestionTitle),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            StateBuilder<LearnerStore>(
              models: [store],
              builder: (context, reactiveModel) {
                return reactiveModel.whenConnectionState(
                    onIdle: () => Container(),
                    onWaiting: () => Center(
                          child: CircularProgressIndicator(),
                        ),
                    onData: (data) => Container(),
                    onError: (error) => ErrorWidget(error));
              },
            ),
            Container(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(S.of(context).learnerQuestionUploadHint),
                      SizedBox(
                        height: 200,
                        child: _image == null
                            ? Image(
                                image: AssetImage("assets/placeholder.jpg"),
                              )
                            : Image.file(_image),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: RaisedButton(
                          onPressed: () => _pickImage(),
                          child: Text("Bild hochladen"),
                        ),
                      )
                    ],
                  ),
                  TextField(
                    maxLines: 8,
                    onChanged: (value) => _question = value,
                    decoration: InputDecoration(
                        hintText: "Hast du noch eine Frage?",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CustomButtonWidget(
                        onPressed: () {
                          store.setState((state) => state
                              .addPictureAndQuestionToLearnRequest(
                                _image,
                                _question,
                              )
                              .then((value) => {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.learnerRequestsOverview,
                                    )
                                  }));
                        },
                        buttonTitle: "Lerngesuch aufgeben"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }
}
