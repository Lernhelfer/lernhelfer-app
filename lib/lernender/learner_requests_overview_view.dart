import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lernhelfer/core/models/learn_requests.dart';
import 'package:lernhelfer/generated/l10n.dart';
import 'package:lernhelfer/logic/learner_store.dart';
import 'package:lernhelfer/navigation/routes.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class LearnerRequestsOverviewView extends StatefulWidget {
  @override
  _LearnerRequestsOverviewViewState createState() =>
      _LearnerRequestsOverviewViewState();
}

class _LearnerRequestsOverviewViewState
    extends State<LearnerRequestsOverviewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).learnerRequestsOverview),
      ),
      body: SafeArea(
        child: Stack(children: <Widget>[
          StateBuilder<LearnerStore>(
            models: [Injector.getAsReactive<LearnerStore>()],
            initState: (context, store) {
              store.setState((state) => state.loadCurrentLearnRequests('0'));
            },
            builder: (context, reactiveModel) {
              return reactiveModel.whenConnectionState(
                  onIdle: () => Container(),
                  onWaiting: () => Center(
                        child: CircularProgressIndicator(),
                      ),
                  onData: (store) => buildPage(store),
                  onError: (error) => ErrorWidget(error));
            },
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: S.of(context).addRequest,
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(
          context,
          Routes.learnerLookingForTopic,
        ),
      ),
    );
  }

  deleteRequest(LearnRequest item, BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.hideCurrentSnackBar();
    scaffold.showSnackBar(
        SnackBar(content: Text("lösche Anfrage ${item.subject}")));
  }

  setChoosenListElement(LearnRequest item, BuildContext context) {
    Navigator.pushNamed(context, Routes.learnerConversationOptions,
        arguments: item);
  }

  buildPage(LearnerStore store) {
    List<LearnRequest> currentLearnRequests = store.currentLearnRequest;

    return ListView.builder(
        itemCount: currentLearnRequests.length,
        itemBuilder: (BuildContext context, int index) {
          final item = currentLearnRequests[index];
          return Card(
              child: ListTile(
            title: Text(item.subject + ": " + item.topics[0],
                style: TextStyle(fontSize: 20)),
            subtitle: Text(item.question),
            trailing: Column(children: <Widget>[
              Icon(Icons.message),
              GestureDetector(
                child: Icon(Icons.delete),
                onTap: () => deleteRequest(item, context),
              )
            ]),
            onTap: () => setChoosenListElement(item, context),
          ));
        });
  }
}
