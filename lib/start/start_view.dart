import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lernhelfer/generated/l10n.dart';
import 'package:lernhelfer/navigation/routes.dart';

class StartView extends StatefulWidget {
  @override
  _StartViewState createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appName),
      ),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        Routes.learnerCreateProfile,
                      ),
                      child: Text(S.of(context).learnerPath),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    FlatButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        Routes.teacherCreateProfile,
                      ),
                      child: Text(S.of(context).teacherPath),
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Image.asset(
                    'assets/wirvsvirus_logo.png',
                    height: 100,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
