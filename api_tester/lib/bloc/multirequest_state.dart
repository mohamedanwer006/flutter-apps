part of 'multirequest_bloc.dart';

abstract class MultirequestState extends Equatable {
  const MultirequestState();
  
  @override
  List<Object> get props => [];
}

class MultirequestInitial extends MultirequestState {}
