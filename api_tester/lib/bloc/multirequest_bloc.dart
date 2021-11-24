import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'multirequest_event.dart';
part 'multirequest_state.dart';

class MultirequestBloc extends Bloc<MultirequestEvent, MultirequestState> {
  MultirequestBloc() : super(MultirequestInitial()) {
    on<MultirequestEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  @override
  Stream<MultirequestState> mapEventToState(MultirequestEvent event) async* {}
}
