import 'package:bingo_app/config/palette.dart';
import 'package:bingo_app/screens/bingo_new_game.dart';
import 'package:bingo_app/screens/bingo_table.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Palette.red,
      ),
      home: BingoNewGame(),
      routes: {
        BingoNewGame.routeName: (ctx) => BingoNewGame(),
        BingoTable.routeName: (ctx) => const BingoTable()
      },
    );
  }
}
