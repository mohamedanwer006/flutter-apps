import 'package:algorithm_v/src/bloc/codespeed_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sort_event.dart';
part 'sort_state.dart';

class SortBloc extends Bloc<SortEvent, SortState> {
  CodespeedBloc codespeedBloc;
  SortBloc({required this.codespeedBloc}) : super(const SortInitial(list: [])) {
    on<BubbleSortEvent>((event, emit) async {
      List<int> list;

      int n = event.list.length;
      list = event.list;
      int i, j;
      for (i = 0; i < n - 1; i++) {
        // Last i elements are already in place
        for (j = 0; j < n - i - 1; j++) {
          if (list[j] > list[j + 1]) {
            //swap
            int temp = list[j];
            list[j] = list[j + 1];
            list[j + 1] = temp;
          }

          await Future.delayed(
              Duration(milliseconds: codespeedBloc.state.speed));
          emit(SortLoadeding(list: list, current: j + 1, next: j + 1));
        }
      }
    });

    on<SelectionSortEvent>((event, emit) async {
      List<int> list;
      int i, j, minIndex;
      int n = event.list.length;
      list = event.list;
      late int currentCheck;
      for (i = 0; i < n - 1; i++) {
        minIndex = i;
        for (j = i + 1; j < n; j++) {
          currentCheck = i;
          if (list[j] < list[minIndex]) {
            minIndex = j;
          }
        }
//     swapp
        if (minIndex != i) {
          var temp = list[minIndex];
          list[minIndex] = list[i];
          list[i] = temp;
          emit(
              SortLoadeding(list: list, current: minIndex, next: currentCheck));
          await Future.delayed(
              Duration(milliseconds: codespeedBloc.state.speed));
        }

        print(list);
      }
    });
  }

  // @override
  // Stream<SortState> mapEventToState(SortEvent event) async* {
  //   List<int> list;
  //   if (event is BubbleSortEvent) {
  //     int n = event.list.length;
  //     list = event.list;
  //     late int i, j;
  //     for (i = 0; i < n - 1; i++) {
  //       // Last i elements are already in place
  //       for (j = 0; j < n - i - 1; j++) {
  //         if (list[j] > list[j + 1]) {
  //           //swap
  //           int temp = list[j + 1];
  //           list[j + 1] = list[j];
  //           list[j] = temp;
  //         }
  //         await Future.delayed(
  //             Duration(milliseconds: codespeedBloc.state.speed));
  //         yield SortLoadeding(list: list, current: j, next: j);
  //       }
  //     }
  //   }
  // }
}
