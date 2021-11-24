part of 'codespeed_bloc.dart';

class CodespeedState extends Equatable {
  final int speed;
  const CodespeedState(
    this.speed,
  );

  @override
  List<Object> get props => [speed];
}
