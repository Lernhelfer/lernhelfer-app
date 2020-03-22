import 'package:flutter/widgets.dart';

class HeadlineWidget extends StatelessWidget {
  final String headline;
  HeadlineWidget({this.headline});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        headline,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
