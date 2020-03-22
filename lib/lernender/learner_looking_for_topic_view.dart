import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lernhelfer/generated/l10n.dart';
import 'package:lernhelfer/logic/learner_store.dart';
import 'package:lernhelfer/navigation/routes.dart';
import 'package:lernhelfer/widgets/loading_widget.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class LearnerLookingForTopicView extends StatefulWidget {
  @override
  _LearnerLookingForTopicViewState createState() =>
      _LearnerLookingForTopicViewState();
}

class _LearnerLookingForTopicViewState
    extends State<LearnerLookingForTopicView> {
  String _selectedTopic;
  String _selectedSubject;

  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).learnerTopicTitle),
      ),
      body: SafeArea(
        child: Stack(children: <Widget>[
          StateBuilder<LearnerStore>(
            models: [Injector.getAsReactive<LearnerStore>()],
            initState: (context, store) {
              store.setState((store) => store.getAllTopicsForSubjects());
            },
            builder: (context, reactiveModel) {
              return reactiveModel.whenConnectionState(
                  onIdle: () => Container(),
                  onWaiting: () => LoadingWidget(),
                  onData: (store) => buildPage(store),
                  onError: (error) => ErrorWidget(error));
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                Routes.learnerLookingForHelpQuestion,
              ),
              child: Text(S.of(context).goOn),
            ),
          )
        ]),
      ),
    );
  }

  Widget buildPage(LearnerStore store) {
    var data = store.allTopicsForSubjects;
    var subjects = data.keys.toList();
    var topics = List<String>();
    if (_selectedSubject == null) {
      _selectedSubject = subjects.first;
    }
    if (_selectedTopic == null) {
      _selectedTopic = S.of(context).learnerTopicNotChosen;
    }
    topics = data[_selectedSubject];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(children: [
        Container(
          child: new DropdownButton(
            items: getSubjects(subjects),
            value: _selectedSubject,
            onChanged: (value) => changedSubject(value),
          ),
        ),
        Text(_selectedTopic),
        Expanded(
          child: ListView.builder(
              itemCount: topics.length,
              itemBuilder: (BuildContext context, int index) {
                final item = topics[index];
                return ListTile(
                  title: Text(item),
                  trailing: item == _selectedTopic
                      ? Icon(FontAwesomeIcons.check)
                      : null,
                  onTap: () => setChoosenListElement(item),
                );
              }),
        ),
      ]),
    );
  }

  void changedSubject(String selectedSubject) {
    _selectedSubject = selectedSubject;
    setState(() {
      _selectedSubject = selectedSubject;
    });
  }

  List<DropdownMenuItem<String>> getSubjects(List<String> subjects) {
    List<DropdownMenuItem<String>> items = new List();
    for (String subject in subjects) {
      items.add(new DropdownMenuItem(value: subject, child: new Text(subject)));
    }
    return items;
  }

  setChoosenListElement(String selectedTopic) {
    _selectedTopic = selectedTopic;
    setState(() {
      _selectedTopic = selectedTopic;
    });
  }
}
