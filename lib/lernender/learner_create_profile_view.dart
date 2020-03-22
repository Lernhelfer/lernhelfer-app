import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lernhelfer/generated/l10n.dart';
import 'package:lernhelfer/logic/learner_store.dart';
import 'package:lernhelfer/navigation/routes.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class LearnerCreateProfileView extends StatefulWidget {
  @override
  _LearnerCreateProfileViewState createState() =>
      _LearnerCreateProfileViewState();
}

class _LearnerCreateProfileViewState extends State<LearnerCreateProfileView> {
  final _formKey = GlobalKey<FormState>();
  final userNameTextController = TextEditingController();

  String _currentName;

  List<DropdownMenuItem<String>> _regionDropDownMenuItems;
  String _currentRegion;

  List<DropdownMenuItem<int>> _gradesDropDownMenuItems;
  int _currentGrade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).learnerCreateProfile),
      ),
      body: SafeArea(
        child: StateBuilder<LearnerStore>(
          models: [Injector.getAsReactive<LearnerStore>()],
          initState: (context, store) {
            store.setState((store) => store.getRegionsAndGrades());
          },
          builder: (context, reactiveModel) {
            return reactiveModel.whenConnectionState(
                onIdle: () => Container(),
                onWaiting: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                onData: (store) => buildContent(store),
                onError: (error) => ErrorWidget(error));
          },
        ),
      ),
    );
  }

  Widget buildContent(LearnerStore store) {
    _regionDropDownMenuItems = getRegionDropDownMenuItems(store.regions);
    _gradesDropDownMenuItems = getGradeDropDownMenuItems(store.grades);

    return Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(0.0),
                child: TextFormField(
                  controller: userNameTextController,
                  validator: (value) =>
                      value.isEmpty ? S.of(context).usernameHint : null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: S.of(context).username,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(0.0),
                //  padding: const EdgeInsets.all(10),
                child: new DropdownButtonFormField(
                  isExpanded: true,
                  hint: Text(S.of(context).gradeHint),
                  icon: Icon(Icons.school),
                  value: _currentGrade,
                  items: _gradesDropDownMenuItems,
                  validator: (value) => value == null ? S.of(context).currentGradeQuestion : null,
                  onChanged: changedGradeDropDownItem,
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(0.0),
                child: new DropdownButtonFormField(
                  isExpanded: true,
                  hint: Text(S.of(context).state),
                  icon: Icon(Icons.place),
                  value: _currentRegion,
                  items: _regionDropDownMenuItems,
                  validator: (value) => value == null ? S.of(context).stateSchoolQuestion : null,
                  onChanged: changedRegionDropDownItem,
                ),
              ),
              RaisedButton(
                onPressed: createStudentProfile,
                child: Text(S.of(context).createProfile, style: TextStyle(fontSize: 17)),
              ),
            ],
          ),
        ));
  }

  List<DropdownMenuItem<String>> getRegionDropDownMenuItems(
      List<String> regions) {
    List<DropdownMenuItem<String>> items = new List();
    for (String region in regions) {
      items.add(new DropdownMenuItem(value: region, child: new Text(region)));
    }
    return items;
  }

  List<DropdownMenuItem<int>> getGradeDropDownMenuItems(List<int> grades) {
    List<DropdownMenuItem<int>> items = new List();
    for (int grade in grades) {
      items.add(new DropdownMenuItem(
          value: grade, child: new Text(S.of(context).gradeN(grade))));
    }
    return items;
  }

  void changedRegionDropDownItem(String selectedRegion) {
    setState(() {
      _currentRegion = selectedRegion;
    });
  }

  void changedGradeDropDownItem(int grade) {
    setState(() {
      _currentGrade = grade;
    });
  }

  void createStudentProfile() {
    _currentName = userNameTextController.text;

    print(
        "Selected name $_currentName grade $_currentGrade region $_currentRegion");

    if (_formKey.currentState.validate()) {
      // create user profile via API
      Injector.get<LearnerStore>()
          .createProfile(_currentName, _currentGrade, _currentRegion)
          .then((value) {});
      Navigator.pushNamed(
        context,
        Routes.learnerRequestsOverview
        //Routes.learnerLookingForHelp,
      );
    }
  }

  Future loadRegionsAndGrades() async {
  }
}
