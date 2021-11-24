part of 'sort_bloc.dart';

abstract class SortEvent extends Equatable {
  const SortEvent();

  @override
  List<Object> get props => [];
}

class BubbleSortEvent extends SortEvent {
  final List<int> list;
  const BubbleSortEvent({
    required this.list,
  });
}

class SelectionSortEvent extends SortEvent {
  final List<int> list;
  const SelectionSortEvent({
    required this.list,
  });
}
