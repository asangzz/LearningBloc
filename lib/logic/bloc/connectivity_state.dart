part of 'connectivity_bloc.dart';

@immutable
abstract class ConnectivityState {}

class ConnectivityInitialState extends ConnectivityState {}

class ConnectivityEnabledState extends ConnectivityState {}

class ConnectivityDisabledState extends ConnectivityState {}
