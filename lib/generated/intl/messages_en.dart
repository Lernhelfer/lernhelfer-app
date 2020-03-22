// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(grade) => "${grade}. grade";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "addRequest" : MessageLookupByLibrary.simpleMessage("Add"),
    "appName" : MessageLookupByLibrary.simpleMessage("Learn Helper"),
    "chooseSubjects" : MessageLookupByLibrary.simpleMessage("Choose your subjects"),
    "createProfile" : MessageLookupByLibrary.simpleMessage("Create profile"),
    "currentGradeQuestion" : MessageLookupByLibrary.simpleMessage("What\'s your current grade?"),
    "goOn" : MessageLookupByLibrary.simpleMessage("Go on!"),
    "gradeHint" : MessageLookupByLibrary.simpleMessage("Grade"),
    "gradeN" : m0,
    "learnerCreateProfile" : MessageLookupByLibrary.simpleMessage("Learner create profile"),
    "learnerPath" : MessageLookupByLibrary.simpleMessage("I\'m a student and are looking for help"),
    "learnerQuestionTitle" : MessageLookupByLibrary.simpleMessage("Do you have more information?"),
    "learnerQuestionUploadHint" : MessageLookupByLibrary.simpleMessage("You can upload an image of your task here"),
    "learnerRequestsOverview" : MessageLookupByLibrary.simpleMessage("Your requests"),
    "learnerTopicNotChosen" : MessageLookupByLibrary.simpleMessage("No topic chosen"),
    "learnerTopicTitle" : MessageLookupByLibrary.simpleMessage("Where do you need help?"),
    "state" : MessageLookupByLibrary.simpleMessage("State"),
    "stateSchoolQuestion" : MessageLookupByLibrary.simpleMessage("In which state is your school?"),
    "teacherCreateProfile" : MessageLookupByLibrary.simpleMessage("Teacher create profile"),
    "teacherPath" : MessageLookupByLibrary.simpleMessage("I\'m a teacher and would like to help"),
    "username" : MessageLookupByLibrary.simpleMessage("Name"),
    "usernameHint" : MessageLookupByLibrary.simpleMessage("What\'s your name?")
  };
}
