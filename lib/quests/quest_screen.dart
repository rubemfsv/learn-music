import 'package:flutter/material.dart' hide Action;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learntech/models/quest_category.dart';
import 'package:learntech/store/quest_level_store.dart';
import 'package:mobx/mobx.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen(this.category);

  final QuestCategory category;

  @override
  _QuestScreenState createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  final questLevelStore = QuestLevelStore();

  @override
  void initState() {
    questLevelStore.init(widget.category);
    super.initState();
  }

  @override
  void dispose() {
    questLevelStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (context) {
          if (questLevelStore.loader.status == FutureStatus.pending) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Text(questLevelStore.basicLevel.description);
        }),
      ),
    );
  }
}
