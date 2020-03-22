import 'package:lernhelfer/core/backend/api_service.dart';
import 'package:lernhelfer/core/enums/learn_request_status.dart';
import 'package:lernhelfer/core/models/learn_requests.dart';
import 'package:lernhelfer/core/models/topic_subjects_wrapper.dart';

class MockedApiService extends ApiService {
  MockedApiService() : super.mocked();

  final List<String> _subjects = [
    "Mathematik",
    "Biologie",
    "Deutsch",
    "Polnisch"
  ];

  @override
  Future<List<int>> getGrades() async {
    await Future.delayed(Duration(milliseconds: 500));
    return [
      7,
      8,
      9,
      10,
      11,
      12,
      13,
    ];
  }

  @override
  Future<List<String>> getRegions() async {
    await Future.delayed(Duration(milliseconds: 500));
    return [
      "Niedersachsen",
      "Bayern",
      "Berlin",
      "Hamburg",
      "Bremen",
    ];
  }

  @override
  Future<List<String>> getSubjects() async {
    await Future.delayed(Duration(seconds: 1));
    return _subjects;
  }

  @override
  Future<List<String>> getTopicsForSubject(String subject) async {
    await Future.delayed(Duration(seconds: 1));
    return _topicsForSubject(subject);
  }

  List<String> _topicsForSubject(String subject) {
    List<String> topics;
    if (subject.toLowerCase() == 'Mathematik'.toLowerCase()) {
      topics = [
        "Kurvendiskussion",
        "Stochastik",
        "Wahrscheinlichkeitsberechnung",
        "Wahrscheinlichkeitsberechnung",
        "Wahrscheinlichkeitsberechnung",
        "Wahrscheinlichkeitsberechnung",
        "Wahrscheinlichkeitsberechnung",
        "Wahrscheinlichkeitsberechnung",
      ];
    } else if (subject.toLowerCase() == 'Biologie'.toLowerCase()) {
      topics = [
        "Bio1",
        "Bio2",
        "Bio3",
      ];
    } else if (subject.toLowerCase() == 'Deutsch'.toLowerCase()) {
      topics = [
        "Deutsch1",
        "Deutsch2",
        "Deutsch3",
      ];
    } else if (subject.toLowerCase() == 'Polnisch'.toLowerCase()) {
      topics = [
        "Polnisch1",
        "Polnisch2",
        "Polnisch3",
      ];
    } else {
      topics = [];
    }

    return topics;
  }

  @override
  Future<TopicSubjectsWrapper> getAllTopicsForSubjects() async {
    await Future.delayed(Duration(seconds: 1));
    var data = {
      "Mathematik": [
        "Kurvendiskussion",
        "Stochastik",
        "Analyses",
        "Wahrscheinlichkeitsberechnung",
        "PQ-Formel",
        "Parablen"
      ],
      "Biologie": [
        "Bio1",
        "Bio2",
        "Bio3",
      ],
      "Deutsch": [
        "Deutsch1",
        "Deutsch2",
        "Deutsch3",
      ],
      "Polnisch": [
        "Polnisch1",
        "Polnisch2",
        "Polnisch3",
      ]
    };
    return TopicSubjectsWrapper(data: data);
  }

  @override
  Future<LearnRequest> getLearnRequest(Map<String, String> request) {
    // TODO: implement getLearnRequest
    throw UnimplementedError();
  }

  @override
  Future<List<LearnRequest>> getLearnRequestsForStudentUid(
      String studentUid) async {
    await Future.delayed(Duration(seconds: 1));

    List<LearnRequest> learnRequests = [];

    for (int idx = 0; idx < 3; idx++) {
      LearnRequest temporaererLearnRequest = LearnRequest(
        learnRequestId: idx.toString(),
        lastModificationDate: DateTime.now(),
        studentUid: idx.toString(),
        subject: _subjects[idx],
        topics: _topicsForSubject(_subjects[idx]),
        image: "",
        question: "Was ist die Anwort auf den Sinn des Lebens?",
        status: LearnRequestStatus.Open,
        messages: ["Ich schätze 42", "asd"],
      );
      learnRequests.add(temporaererLearnRequest);
    }
    return learnRequests;
  }

  @override
  Future<LearnRequest> addLearnRequest(LearnRequest request) async {
    await Future.delayed(Duration(seconds: 1));
    //do nothing for now
  }

  @override
  Future<String> createStudentProfile(Map<String, int> studentProfile) async {
    await Future.delayed(Duration(seconds: 1));
  }
}
