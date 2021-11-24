import 'dart:math';

abstract class SortRepo {
  List<int> generateList();
  List<int> selectionSort(List<int> list);
}

class ISortRepo implements SortRepo {
  @override
  List<int> generateList() {
    return List.generate(50, (_) => Random().nextInt(1000));
  }

  @override
  List<int> selectionSort(List<int> list) {
    List<int> sortedList = list;
    return sortedList;
  }
}
