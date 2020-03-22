import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lernhelfer/generated/l10n.dart';
import 'package:lernhelfer/logic/teacher_store.dart';
import 'package:lernhelfer/navigation/routes.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class TeacherSkillsView extends StatefulWidget {
  @override
  _TeacherSkillsViewState createState() => _TeacherSkillsViewState();
}

class _TeacherSkillsViewState extends State<TeacherSkillsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).chooseSubjects),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: StateBuilder<TeacherStore>(
            models: [Injector.getAsReactive<TeacherStore>()],
            initState: (context, store) {
              store.setState((store) => store.getWrappedSubjects());
            },
            builder: (context, reactiveModel) {
              return reactiveModel.whenConnectionState(
                  onIdle: () => Container(),
                  onWaiting: () => Center(
                        child: CircularProgressIndicator(),
                      ),
                  onData: (store) => buildPage(store),
                  onError: (error) => ErrorWidget(error));
            },
          ),
        ),
      ),
    );
  }

  Widget buildPage(TeacherStore store) {
    var subjects = store.subjects;
    var grades = store.grades;

    return Stack(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  final subject = subjects[index];
                  return EntryItem(
                      subject, grades, (grade) =>
                      store.isGradeStored(subject, grade), (grade, checked) {
                    setState(() {
                      if (checked) {
                        store.addSubjectAndTopicToSubjectMap(subject, grade);
                      }
                      else {
                        store.removeSubjectAndTopicFromSubjectMap(
                            subject, grade);
                      }
                    });
                  });
                },
                itemCount: subjects.length,
              )
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: store.anyGradesStored()
                    ? () => Navigator.pushNamed(context, Routes.teacherRequestsOverview)
                    : null,
                child: Text(S.of(context).createProfile),
              )
          )
        ]
    );
  }
}

typedef bool IsCheckedLookup(int grade);
typedef void GradeCheckedChanged(int grade, bool checked);

class EntryItem extends StatefulWidget {
  final String subject;
  final List<int> grades;
  final IsCheckedLookup checked;
  final GradeCheckedChanged onGradeCheckedChanged;

  const EntryItem(
      this.subject, this.grades, this.checked, this.onGradeCheckedChanged);

  @override
  State<StatefulWidget> createState() =>
      _EntryItemState(subject, grades, checked, onGradeCheckedChanged);
}

class _EntryItemState extends State<EntryItem> {
  final String subject;
  final List<int> grades;
  final IsCheckedLookup checked;
  final GradeCheckedChanged onGradeCheckedChanged;

  _EntryItemState(
      this.subject, this.grades, this.checked, this.onGradeCheckedChanged);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      key: PageStorageKey<String>(subject),
      title: Text(subject),
      children: grades.map((grade) =>
          CheckboxListTile(
            title: Text(S.of(context).gradeN(grade)),
            value: checked(grade),
            onChanged: (bool value) => onGradeCheckedChanged(grade, value),
          )).toList(),
    );
  }
}
