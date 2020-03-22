import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lernhelfer/core/models/learn_requests.dart';

class LearnerConversationsOptionsView extends StatefulWidget {
  @override
  _LearnerConversationsOptionsViewState createState() =>
      _LearnerConversationsOptionsViewState();
}

class _LearnerConversationsOptionsViewState
    extends State<LearnerConversationsOptionsView> {
  @override
  Widget build(BuildContext context) {
    final LearnRequest request = ModalRoute
        .of(context)
        .settings
        .arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("${request.subject}: ${request.topics[0]}"),
        actions: <Widget>[
          Row(
              children: <Widget>[
                Text("Manuela"),
                Icon(Icons.person)
              ]
          )
        ],
      ),
      body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
              Bubble(
                margin: BubbleEdges.only(top: 10),
                color: Color.fromRGBO(212, 234, 244, 1.0),
                nip: BubbleNip.leftTop,
                child: Text(
                    'Hi Paul, ich bin Manuela. Ich glaube, ich kann dir bei deinem Problem helfen.',
                    style: TextStyle(fontSize: 17)),
              ),
              Bubble(
                margin: BubbleEdges.only(top: 10),
                color: Color.fromRGBO(212, 234, 244, 1.0),
                nip: BubbleNip.leftTop,
                child: Text('Such dir aus, wie wir weiterhin kommunizieren:',
                    style: TextStyle(fontSize: 17)),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/e/ec/Skype-icon-new.png",
                          width: 60
                      ),
                      Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/239px-WhatsApp.svg.png",
                          width: 70
                      ),
                      Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Telegram_logo.svg/240px-Telegram_logo.svg.png",
                          width: 60
                      ),
                      Icon(Icons.phone, size: 60)
                    ],
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("Mir wurde geholfen:"),
                      RaisedButton(
                        color: Colors.green,
                        child: Icon(Icons.check, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("Mir wurde nicht geholfen:"),
                      RaisedButton(
                        color: Colors.red[700],
                        child: Icon(Icons.clear, color: Colors.white),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}
