import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learntech/quests/quest_screen.dart';
import 'package:learntech/store/quest_category_store.dart';
import 'package:provider/provider.dart';

class QuestCategoryListView extends StatelessWidget {
  QuestCategoryListView() : super();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final categories =
            Provider.of<QuestCategoryStore>(context).allCategories;

        return ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];

            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return QuestScreen(category);
                    },
                  ),
                );
              },
              title: Observer(
                builder: (context) => Text(category.description),
              ),
            );
          },
        );
      },
    );
  }
}