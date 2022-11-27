// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:bingo_app/constants.dart';
import 'package:bingo_app/models/bingo_game.dart';
import 'package:bingo_app/screens/bingo_table.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BingoNewGame extends StatelessWidget {
  static const routeName = '/new';

  FirebaseFirestore db = FirebaseFirestore.instance;

  BingoNewGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Nuevo juego'),
      ),
      body: Scrollbar(
        child: ListView(
          restorationId: 'bingo_new_game',
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            for (final item in gameModes)
              ListTile(
                title: Text(item.title),
                onTap: () {
                  db
                      .collection('bingo')
                      .doc('current')
                      .update(BingoGame(type: item.type).toDoc());
                  Navigator.of(context)
                      .pushReplacementNamed(BingoTable.routeName);
                },
                subtitle: null,
              ),
          ],
        ),
      ),
    );
  }
}
