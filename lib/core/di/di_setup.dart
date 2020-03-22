import 'package:dio/dio.dart';
import 'package:lernhelfer/core/backend/api_service.dart';
import 'package:lernhelfer/core/backend/mocked_api_service.dart';
import 'package:lernhelfer/logic/learner_store.dart';
import 'package:lernhelfer/logic/teacher_store.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

List<Injectable> di = [...independentServices, ...dependentServices];

List<Inject<Object>> independentServices = [
  Inject<ApiService>(() {
    final dio = Dio();
    final apiService = ApiService(dio);
    return MockedApiService();
  }),
];

List<Injectable> dependentServices = [
  Inject<LearnerStore>(() => LearnerStore(Injector.get<ApiService>())),
  Inject<TeacherStore>(() => TeacherStore(Injector.get<ApiService>())),
];
