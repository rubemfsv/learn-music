import 'package:flutter/material.dart';
import 'package:learntech/home/home_screen.dart';
import 'package:learntech/store/quest_category_store.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          return Provider<QuestCategoryStore>(
            create: (_) {
              final store = QuestCategoryStore();
              store.init();
              return store;
            },
            // dispose: (_, store) => store.dispose(),
            child: MaterialApp(
              initialRoute: "/",
              routes: {
                "/": (context) => const HomeScreen(),
              },
            ),
          );
        }
       );
  }
}

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Observer(builder: (context) {
//         final store = Provider.of<QuestCategoryStore>(context);

//         if (store.loader.status == FutureStatus.pending) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         return QuestCategoryListView();
//       }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
