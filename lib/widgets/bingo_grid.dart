// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class BingoGrid extends StatelessWidget {
  const BingoGrid({Key? key, required this.numbers}) : super(key: key);

  final List<int> numbers;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      restorationId: 'bingo_grid',
      crossAxisCount: 3,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      padding: const EdgeInsets.all(16),
      childAspectRatio: 1,
      children: numbers.map<Widget>((number) {
        return _BingoGridItem(
          number: number,
        );
      }).toList(),
    );
  }
}

class _BingoGridItem extends StatelessWidget {
  const _BingoGridItem({Key? key, required this.number}) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      heroTag: "btn$number",
      tooltip: number.toString(),
      child: Text(
        number.toString(),
        style: const TextStyle(fontSize: 24.0),
      ),
    );
  }
}
