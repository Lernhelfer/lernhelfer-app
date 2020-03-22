// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  final String localeName;

  String get appName {
    return Intl.message(
      'Learn Helper',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  String get learnerPath {
    return Intl.message(
      'I\'m a student and are looking for help',
      name: 'learnerPath',
      desc: '',
      args: [],
    );
  }

  String get teacherPath {
    return Intl.message(
      'I\'m a teacher and would like to help',
      name: 'teacherPath',
      desc: '',
      args: [],
    );
  }

  String get learnerCreateProfile {
    return Intl.message(
      'Learner create profile',
      name: 'learnerCreateProfile',
      desc: '',
      args: [],
    );
  }

  String get teacherCreateProfile {
    return Intl.message(
      'Teacher create profile',
      name: 'teacherCreateProfile',
      desc: '',
      args: [],
    );
  }

  String get learnerRequestsOverview {
    return Intl.message(
      'Your requests',
      name: 'learnerRequestsOverview',
      desc: '',
      args: [],
    );
  }

  String get addRequest {
    return Intl.message(
      'Add',
      name: 'addRequest',
      desc: '',
      args: [],
    );
  }

  String get usernameHint {
    return Intl.message(
      'What\'s your name?',
      name: 'usernameHint',
      desc: '',
      args: [],
    );
  }

  String get username {
    return Intl.message(
      'Name',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  String get gradeHint {
    return Intl.message(
      'Grade',
      name: 'gradeHint',
      desc: '',
      args: [],
    );
  }

  String gradeN(dynamic grade) {
    return Intl.message(
      '$grade. grade',
      name: 'gradeN',
      desc: '',
      args: [grade],
    );
  }

  String get currentGradeQuestion {
    return Intl.message(
      'What\'s your current grade?',
      name: 'currentGradeQuestion',
      desc: '',
      args: [],
    );
  }

  String get state {
    return Intl.message(
      'State',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  String get stateSchoolQuestion {
    return Intl.message(
      'In which state is your school?',
      name: 'stateSchoolQuestion',
      desc: '',
      args: [],
    );
  }

  String get createProfile {
    return Intl.message(
      'Create profile',
      name: 'createProfile',
      desc: '',
      args: [],
    );
  }

  String get goOn {
    return Intl.message(
      'Go on!',
      name: 'goOn',
      desc: '',
      args: [],
    );
  }

  String get chooseSubjects {
    return Intl.message(
      'Choose your subjects',
      name: 'chooseSubjects',
      desc: '',
      args: [],
    );
  }

  String get learnerTopicNotChosen {
    return Intl.message(
      'No topic chosen',
      name: 'learnerTopicNotChosen',
      desc: '',
      args: [],
    );
  }

  String get learnerTopicTitle {
    return Intl.message(
      'Where do you need help?',
      name: 'learnerTopicTitle',
      desc: '',
      args: [],
    );
  }

  String get learnerQuestionTitle {
    return Intl.message(
      'Do you have more information?',
      name: 'learnerQuestionTitle',
      desc: '',
      args: [],
    );
  }

  String get learnerQuestionUploadHint {
    return Intl.message(
      'You can upload an image of your task here',
      name: 'learnerQuestionUploadHint',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'de'), Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}