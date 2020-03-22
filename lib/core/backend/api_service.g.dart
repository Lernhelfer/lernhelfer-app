// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'http://5.9.24.52:65000/v1/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getGrades() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/classes',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data.cast<int>();
    return Future.value(value);
  }

  @override
  getRegions() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/regions',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data.cast<String>();
    return Future.value(value);
  }

  @override
  getSubjects() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/subjects',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data.cast<String>();
    return Future.value(value);
  }

  @override
  getTopicsForSubject(subject) async {
    ArgumentError.checkNotNull(subject, 'subject');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = subject;
    final Response<List<dynamic>> _result = await _dio.request('subject/topics',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data.cast<String>();
    return Future.value(value);
  }

  @override
  getAllTopicsForSubjects() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'subject/topics/all',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TopicSubjectsWrapper.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  createStudentProfile(studentProfile) async {
    ArgumentError.checkNotNull(studentProfile, 'studentProfile');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(studentProfile ?? <String, dynamic>{});
    final Response<String> _result = await _dio.request('student/profile',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return Future.value(value);
  }

  @override
  addLearnRequest(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request?.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/learnRequest',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = LearnRequest.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getLearnRequest(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/learnRequest',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = LearnRequest.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getLearnRequestsForStudentUid(studentUid) async {
    ArgumentError.checkNotNull(studentUid, 'studentUid');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = studentUid;
    final Response<List<dynamic>> _result = await _dio.request('/learnRequest',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => LearnRequest.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }
}
