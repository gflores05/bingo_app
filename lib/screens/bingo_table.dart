// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:bingo_app/constants.dart';
import 'package:bingo_app/screens/bingo_new_game.dart';
import 'package:bingo_app/widgets/bingo_grid.dart';
import 'package:flutter/material.dart';

class BingoTable extends StatefulWidget {
  static const routeName = '/table';

  const BingoTable({super.key});

  @override
  BingoTableState createState() => BingoTableState();
}

class BingoTableState extends State<BingoTable>
    with SingleTickerProviderStateMixin, RestorationMixin {
  late TabController _tabController;

  final RestorableInt tabIndex = RestorableInt(0);

  @override
  String get restorationId => 'bingo_table';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 5,
      vsync: this,
    );
    _tabController.addListener(() {
      // When the tab controller's value is updated, make sure to update the
      // tab index value, which is state restorable.
      setState(() {
        tabIndex.value = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bingo",
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: [
            for (final tab in bingoCells.keys) Tab(text: tab),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          for (final tab in bingoCells.keys)
            Center(
              child: BingoGrid(numbers: bingoCells[tab]!),
            ),
        ],
      ),
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
