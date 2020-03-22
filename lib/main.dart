import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lernhelfer/generated/l10n.dart';
import 'package:lernhelfer/lernender/learner_conversation_options_view.dart';
import 'package:lernhelfer/lernender/learner_create_profile_view.dart';
import 'package:lernhelfer/lernender/learner_looking_for_help_question_view.dart';
import 'package:lernhelfer/lernender/learner_looking_for_topic_view.dart';
import 'package:lernhelfer/lernender/learner_requests_overview_view.dart';
import 'package:lernhelfer/start/start_view.dart';
import 'package:lernhelfer/wissenstraeger/teacher_conversation_options_view.dart';
import 'package:lernhelfer/wissenstraeger/teacher_create_profile_view.dart';
import 'package:lernhelfer/wissenstraeger/teacher_requests_overview_view.dart';
import 'package:lernhelfer/wissenstraeger/teacher_skills_view.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'core/di/di_setup.dart';
import 'navigation/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: di,
      builder: (context) {
        return MaterialApp(
          title: 'Lernhelfer',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate
          ],
          supportedLocales: S.delegate.supportedLocales,
          initialRoute: Routes.startView,
          routes: <String, WidgetBuilder>{
            Routes.startView: (context) => StartView(),
            //learner
            Routes.learnerCreateProfile: (context) =>
                LearnerCreateProfileView(),
            Routes.learnerLookingForTopic: (context) =>
                LearnerLookingForTopicView(),
            Routes.learnerLookingForHelpQuestion: (context) =>
                LearnerLookingForHelpQuestionView(),
            Routes.learnerRequestsOverview: (context) =>
                LearnerRequestsOverviewView(),
            Routes.learnerConversationOptions: (context) =>
                LearnerConversationsOptionsView(),
            //teacher
            Routes.teacherCreateProfile: (context) =>
                TeacherCreateProfileView(),
            Routes.teacherSkills: (context) => TeacherSkillsView(),
            Routes.teacherConversationOptions: (context) =>
                TeacherConversationOptionsView(),
            Routes.teacherRequestsOverview: (context) =>
                TeacherRequestsOverviewView()
          },
        );
      },
    );
  }
}
