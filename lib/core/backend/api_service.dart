import 'package:dio/dio.dart';
import 'package:lernhelfer/core/models/learn_requests.dart';
import 'package:lernhelfer/core/models/topic_subjects_wrapper.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://5.9.24.52:65000/v1/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  ApiService.mocked();

  @GET("/classes")
  Future<List<int>> getGrades();
  @GET("/regions")
  Future<List<String>> getRegions();
  @GET("/subjects")
  Future<List<String>> getSubjects();
  @GET("subject/topics")
  Future<List<String>> getTopicsForSubject(@Body() String subject);

  @GET("subject/topics/all")
  Future<TopicSubjectsWrapper> getAllTopicsForSubjects();

  @POST("student/profile")
  Future<String> createStudentProfile(@Body() Map<String, int> studentProfile);

  @POST("/learnRequest")
  Future<LearnRequest> addLearnRequest(@Body() LearnRequest request);
  @GET("/learnRequest")
  Future<LearnRequest> getLearnRequest(@Body() Map<String, String> request);
  @GET("/learnRequest")
  Future<List<LearnRequest>> getLearnRequestsForStudentUid(
      @Body() String studentUid);
}
