import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learntech/home/quest_category_list_view.dart';
import 'package:learntech/store/quest_category_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Observer(builder: (context) {
        final store = Provider.of<QuestCategoryStore>(context);

        if (store.loader.status == FutureStatus.pending) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return QuestCategoryListView();
      }),
    );
  }
}