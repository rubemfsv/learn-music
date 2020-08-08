import 'package:flutter/material.dart' hide Action;

class QuestScreen extends StatefulWidget {
  const QuestScreen();

  @override
  _QuestScreenState createState() => _QuestScreenState();
}

  class _QuestScreenState extends State<QuestScreen>  {

    @override
    Widget  build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Level Description")
        ),
      );
    }
  }