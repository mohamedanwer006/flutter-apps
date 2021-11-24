part of 'connectivity_cubit.dart';

enum Connection { Wifi, Mobile }

@immutable
abstract class ConnectivityState {}

class ConnectivityInitial extends ConnectivityState {}

class Connectivity extends ConnectivityState {}
