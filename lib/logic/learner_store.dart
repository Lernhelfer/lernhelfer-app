import 'dart:io';

import 'package:lernhelfer/core/backend/api_service.dart';
import 'package:lernhelfer/core/models/learn_requests.dart';
import 'package:lernhelfer/core/models/student_profile.dart';

class LearnerStore {
  final ApiService api;

  LearnerStore(this.api);

  StudentProfile _studentProfile;
  LearnRequest _learnRequest;
  String _subject;
  List<String> _topics;

  List<LearnRequest> _currentLearnRequests;
  List<LearnRequest> get currentLearnRequest => _currentLearnRequests;

  Map<String, List<String>> _allTopicsForSubjects;
  Map<String, List<String>> get allTopicsForSubjects => _allTopicsForSubjects;

  String _selectedSubject;
  String get selectedSubject => _selectedSubject;

  List<String> _regions;
  List<String> get regions => _regions;
  List<int> _grades;
  List<int> get grades => _grades;

  Future<void> getRegionsAndGrades() async {
    _regions = await api.getRegions();
    _grades = await api.getGrades();
  }

  Future<List<LearnRequest>> loadCurrentLearnRequests(String studID) async {
    await Future.delayed(Duration(seconds: 1));
    _currentLearnRequests = await api.getLearnRequestsForStudentUid(studID);
    return _currentLearnRequests;
  }

  Future createProfile(String name, int grade, String region) async {
    _studentProfile = StudentProfile(
      studentUid: "test",
      name: name,
      grade: grade,
      region: region,
    );
    await api.createStudentProfile(null);
  }

  Future addSubjectAndTopicsToLearnRequest(
      String subject, List<String> topics) async {
    _subject = subject;
    _topics = topics;
  }

  Future addPictureAndQuestionToLearnRequest(
      File image, String question) async {
    //var imageData = await image.readAsString();
    _learnRequest = LearnRequest(
        learnRequestId: "test2",
        lastModificationDate: DateTime.now(),
        studentUid: "test",
        subject: _subject,
        topics: _topics,
        question: question,
        image: null);
    await api.addLearnRequest(_learnRequest);
  }

  Future<void> getAllTopicsForSubjects() async {
    var wrapper = await api.getAllTopicsForSubjects();
    _allTopicsForSubjects = wrapper.data;
    _selectedSubject = wrapper.data.keys.first;
  }
}
