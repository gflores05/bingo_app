// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:bingo_app/constants.dart';
import 'package:bingo_app/screens/bingo_table.dart';
import 'package:flutter/material.dart';

class BingoNewGame extends StatelessWidget {
  static const routeName = '/new';

  const BingoNewGame({Key? key}) : super(key: key);

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
            for (final gameMode in gameModes)
              ListTile(
                title: Text(gameMode),
                onTap: () {
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
