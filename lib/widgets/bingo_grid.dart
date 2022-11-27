// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BingoGrid extends StatelessWidget {
  const BingoGrid({Key? key, required this.letter, required this.numbers})
      : super(key: key);

  final List<int> numbers;
  final String letter;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.doc('bingo/current').snapshots(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) return const Text('Cargando...');

          return GridView.count(
            restorationId: 'bingo_grid',
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            padding: const EdgeInsets.all(16),
            childAspectRatio: 1,
            children: numbers.asMap().entries.map<Widget>((number) {
              return _BingoGridItem(
                letter: letter,
                number: number.value,
                doc: snapshot.data!,
                index: number.key,
              );
            }).toList(),
          );
        });
  }
}

class _BingoGridItem extends StatelessWidget {
  const _BingoGridItem(
      {Key? key,
      required this.letter,
      required this.number,
      required this.doc,
      required this.index})
      : super(key: key);

  final int number;
  final String letter;
  final DocumentSnapshot doc;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final marked = !doc[letter][index];
        final newVal = [...doc[letter]];
        newVal[index] = marked;

        FirebaseFirestore.instance
            .doc('bingo/current')
            .update({letter: newVal});
      },
      backgroundColor: doc[letter][index]
          ? Color.fromRGBO(22, 163, 74, 1)
          : Color.fromRGBO(153, 27, 27, 1),
      heroTag: "btn$number",
      tooltip: number.toString(),
      child: Text(
        number.toString(),
        style: const TextStyle(fontSize: 24.0),
      ),
    );
  }
}
