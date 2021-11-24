import 'dart:math';

import 'package:algorithm_v/src/bloc/sort_bloc.dart';
import 'package:algorithm_v/src/pages/sort_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = '/';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: const Text('bubbleSort'),
              onPressed: () {
                BlocProvider.of<SortBloc>(context).add(BubbleSortEvent(
                    list: List.generate(25, (_) => Random().nextInt(400))));
                Navigator.pushNamed(context, SortView.routeName);
              },
            ),
            TextButton(
              child: const Text('selection sort'),
              onPressed: () {
                BlocProvider.of<SortBloc>(context).add(SelectionSortEvent(
                    list: List.generate(25, (_) => Random().nextInt(400))));
                Navigator.pushNamed(context, SortView.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
