import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_plugins/block/counter_block.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<CounterBlock, CounterState>(
          listenWhen: (previous, current) {
            if (previous.counterValue == 3) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('previes data:${previous.counterValue}'),
                duration: const Duration(seconds: 1),
              ));
              return false;
            } else {
              return true;
            }
          },
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('data:${state.counterValue}'),
              duration: const Duration(seconds: 1),
            ));
          },
          builder: (context, state) {
            if (state.counterValue == 5) {
              return Text('hhhhh' + state.counterValue.toString());
            }
            return Text(state.counterValue.toString());
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton.extended(
            heroTag: 'dfadsf',
            onPressed: () {
              BlocProvider.of<CounterBlock>(context).increment();
            },
            label: const Text('Approve'),
            icon: const Icon(Icons.add),
            backgroundColor: Colors.pink,
          ),
          FloatingActionButton.extended(
            heroTag: 'sdnak',
            onPressed: () {
              context.read<CounterBlock>().decrement();
            },
            label: const Text('Approve'),
            icon: const Icon(Icons.minimize),
            backgroundColor: Colors.pink,
          ),
          FloatingActionButton(
            heroTag: 'ttt',
            onPressed: () {
              Navigator.pop(context);
            },
            backgroundColor: Colors.pink,
            child: const Text('bk'),
          ),
        ],
      ),
    );
  }
}
