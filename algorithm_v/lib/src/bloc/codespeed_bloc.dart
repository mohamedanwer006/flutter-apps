import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'codespeed_event.dart';
part 'codespeed_state.dart';

class CodespeedBloc extends Bloc<CodespeedEvent, CodespeedState> {
  CodespeedBloc() : super(const CodespeedState(500));

  @override
  Stream<CodespeedState> mapEventToState(CodespeedEvent event) async* {
    yield CodespeedState(event.speed);
  }
}
