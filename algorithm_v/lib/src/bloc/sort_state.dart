part of 'sort_bloc.dart';

abstract class SortState extends Equatable {
  const SortState();

  @override
  List<Object> get props => [];
}

class SortInitial extends SortState {
  final List<int> list;
  const SortInitial({
    required this.list,
  });
}

class SortLoadeding extends SortState {
  final List<int> list;
  final int current;
  final int next;
  const SortLoadeding({
    required this.list,
    required this.current,
    required this.next,
  });
  @override
  List<Object> get props => [list, current, next];
}
