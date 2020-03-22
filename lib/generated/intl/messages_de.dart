// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static m0(grade) => "${grade}. Klasse";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "addRequest" : MessageLookupByLibrary.simpleMessage("Hinzufügen"),
    "appName" : MessageLookupByLibrary.simpleMessage("Lernhelfer"),
    "chooseSubjects" : MessageLookupByLibrary.simpleMessage("Wähle deine Fachgebiete"),
    "createProfile" : MessageLookupByLibrary.simpleMessage("Profil erstellen"),
    "currentGradeQuestion" : MessageLookupByLibrary.simpleMessage("In welcher Klasse bist du?"),
    "goOn" : MessageLookupByLibrary.simpleMessage("Weiter geht\'s!"),
    "gradeHint" : MessageLookupByLibrary.simpleMessage("Klasse"),
    "gradeN" : m0,
    "learnerCreateProfile" : MessageLookupByLibrary.simpleMessage("Schülerprofil anlegen"),
    "learnerPath" : MessageLookupByLibrary.simpleMessage("Ich bin Schüler:in und suche Unterstützung"),
    "learnerQuestionTitle" : MessageLookupByLibrary.simpleMessage("Hast du noch Fragen?"),
    "learnerQuestionUploadHint" : MessageLookupByLibrary.simpleMessage("Hier kannst du ein Bild mit deiner Aufgabe hochladen"),
    "learnerRequestsOverview" : MessageLookupByLibrary.simpleMessage("Deine Hilfegesuche"),
    "learnerTopicNotChosen" : MessageLookupByLibrary.simpleMessage("Wähle ein Thema aus"),
    "learnerTopicTitle" : MessageLookupByLibrary.simpleMessage("Wo brauchst du Hilfe?"),
    "state" : MessageLookupByLibrary.simpleMessage("Bundesland"),
    "stateSchoolQuestion" : MessageLookupByLibrary.simpleMessage("In welchem Bundesland gehst du zur Schule?"),
    "teacherCreateProfile" : MessageLookupByLibrary.simpleMessage("Lehrerprofil anlegen"),
    "teacherPath" : MessageLookupByLibrary.simpleMessage("Ich bin Lehrer:in und möchte unterstützen"),
    "username" : MessageLookupByLibrary.simpleMessage("Name"),
    "usernameHint" : MessageLookupByLibrary.simpleMessage("Wie lautet dein Name?")
  };
}
