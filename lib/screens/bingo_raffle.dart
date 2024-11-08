// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:bingo_app/constants.dart';
import 'package:bingo_app/screens/bingo_new_game.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class BingoRaffle extends StatelessWidget {
  static const routeName = '/raffle';

  const BingoRaffle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tombola'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.doc('bingo/current').snapshots(),
          builder: (ctx, snapshot) {
            if (!snapshot.hasData) return const Text('Cargando...');
            return BingoRaffleGenerator(
              doc: snapshot.data!,
            );
          }),
      drawer: Drawer(
        child: ListView(children: [
          ListTile(
            title: const Text('Nuevo juego'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(BingoNewGame.routeName);
            },
          )
        ]),
      ),
    );
  }
}

class BingoRaffleGenerator extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> doc;

  const BingoRaffleGenerator({super.key, required this.doc});

  @override
  State<BingoRaffleGenerator> createState() => _BingoRaffleGeneratorState();
}

class _BingoRaffleGeneratorState extends State<BingoRaffleGenerator> {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  String lastNumber = '';

  int random(int min, int max) {
    return min + Random().nextInt(max - min);
  }

  void generateNumber() {
    final letters = ['B', 'I', 'N', 'G', 'O'];

    bool generateNew = true;
    String letter = '';
    int number = 0;
    int numberIndex = -1;

    while (generateNew) {
      final letterIndex = random(0, 5);

      letter = letters[letterIndex];

      numberIndex = random(0, 15);

      number = bingoCells[letter]![numberIndex];

      generateNew = widget.doc[letter]![numberIndex];
    }

    setState(() {
      lastNumber = '$letter$number';
    });

    final newVal = [...widget.doc[letter]];
    newVal[numberIndex] = true;

    FirebaseFirestore.instance
        .doc('bingo/current')
        .update({letter: newVal, "last": '$letter$number'});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            lastNumber,
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          FloatingActionButton.large(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            child: const Icon(
              Icons.settings_input_svideo,
              size: 64,
            ),
            onPressed: () {
              generateNumber();
            },
          )
        ],
      ),
    );
  }
}
