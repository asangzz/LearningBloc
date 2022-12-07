part of 'connectivity_bloc.dart';

@immutable
abstract class ConnectivityEvent {}

class ConnectivityEnabledEvent extends ConnectivityEvent {}

class ConnectivityDisabledEvent extends ConnectivityEvent {}
