import 'package:flutter/material.dart';
import 'package:lernhelfer/core/backend/api_service.dart';
import 'package:lernhelfer/core/models/teacher_details.dart';
import 'package:lernhelfer/core/models/teacher_profile.dart';

class TeacherStore {
  final ApiService api;

  TeacherStore(this.api);

  Image _tempTeacherImage;
  String _tempName;

  List<SubjectWrapper> _wrappedSubjects;
  List<SubjectWrapper> get wrappedSubjects => _wrappedSubjects;
  List<String> _tempCommunicationMethods = List<String>();
  Map<String, List<int>> _tempSubjects = Map<String, List<int>>();

  List<String> _subjects;
  List<String> get subjects => _subjects;

  List<String> _topics;
  List<String> get topics => _topics;

  List<int> _grades;
  List<int> get grades => _grades;

  Map<String, List<String>> _data;
  Map<String, List<String>> get data => _data;
  bool isDataInitialized = false;

  void setName(String name) {
    _tempName = name;
  }

  void setImage(Image image) {
    _tempTeacherImage = image;
  }

  Future createProfile() async {
    // Upload image
    TeacherProfile tp = TeacherProfile(
      teacherUid: "test",
      teacherDetails: TeacherDetails(
        name: _tempName,
        communicationMethods: _tempCommunicationMethods,
        subjects: _tempSubjects,
      ),
    );
    // Create teacher profile via API
  }

  void addSubjectAndTopicToSubjectMap(String subject, int grade) {
    if (_tempSubjects.containsKey(subject)) {
      _tempSubjects[subject].add(grade);
    } else {
      List<int> grades = List<int>();
      grades.add(grade);
      _tempSubjects.addAll({'$subject': grades});
    }
  }

  Future<List<SubjectWrapper>> getWrappedSubjects() async {
    await loadData();
    _wrappedSubjects = List<SubjectWrapper>();
    _subjects.forEach((subject) =>
        {_wrappedSubjects.add(SubjectWrapper(subjectName: subject))});
    return _wrappedSubjects;
  }

  Future<void> loadData() async {
    if (isDataInitialized) {
      return _data;
    }
    await delay(2);
    _subjects = await api.getSubjects();
    _grades = await api.getGrades();

    isDataInitialized = true;
  }

  void removeSubjectAndTopicFromSubjectMap(String subject, int grade) {
    _tempSubjects[subject].remove(grade);
  }

  bool isGradeStored(String subject, int grade) {
    if (_tempSubjects.containsKey(subject)) {
      if (_tempSubjects[subject].contains(grade)) {
        return true;
      }
      return false;
    }
    return false;
  }

  bool anyGradesStored() {
    for (var grades in _tempSubjects.values) {
      if (grades.isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  void toggleExpanded(int index) {
    _wrappedSubjects[index].isExpanded = !_wrappedSubjects[index].isExpanded;
  }

  Future delay(int seconds) async {
    await Future.delayed(Duration(seconds: seconds));
  }
}

class SubjectWrapper {
  String subjectName;
  bool isExpanded;
  SubjectWrapper({this.subjectName, this.isExpanded = false});
}
