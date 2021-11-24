import 'package:algorithm_v/src/bloc/codespeed_bloc.dart';
import 'package:algorithm_v/src/bloc/sort_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortView extends StatefulWidget {
  const SortView({Key? key}) : super(key: key);
  static const routeName = '/sortView';
  @override
  _SortViewState createState() => _SortViewState();
}

class _SortViewState extends State<SortView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: BlocConsumer<SortBloc, SortState>(
                listener: (context, state) {
                  if (state is SortLoadeding) {
                  } else {}
                  setState(() {});
                },
                builder: (context, state) {
                  if (state is SortInitial) {
                    return TextButton(
                      child: Text('loading'),
                      onPressed: () =>
                          Navigator.pushNamed(context, SortView.routeName),
                    );
                  } else if (state is SortLoadeding) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 100.0,
                        bottom: 50,
                      ),
                      child: ListView.builder(
                        // reverse: true,

                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.list.length,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          return Padding(
                            padding: EdgeInsets.only(
                                top: state.list[index].toDouble(),
                                bottom: 5,
                                left: 5),
                            child: Container(
                              color: index == state.current
                                  ? Colors.red
                                  : index == state.next - 1
                                      ? Colors.red
                                      : Colors.amber,
                              width: 10,
                              // height: 100,
                            ),
                          );
                        },
                      ),
                    );
                    //  state.list.map((e) =>
                  } else
                    return Text('nothing');
                },
              ),
            ),
          ),
          Container(
            height: 60,
            child: BlocBuilder<CodespeedBloc, CodespeedState>(
              builder: (context, state) {
                return Slider(
                  max: 1000,
                  min: 50,
                  activeColor: Colors.amber,
                  label: 'speed',
                  divisions: 2000 ~/ 100,
                  value: state.speed.toDouble(),
                  onChanged: (value) {
                    BlocProvider.of<CodespeedBloc>(context)
                        .add(CodespeedEvent(value.floor()));
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  int sliderValue = 500;
}
