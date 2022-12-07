import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

enum ConnectivityCubitState { Initial, Connected, Disconnected }

class ConnectivityCubit extends Cubit<ConnectivityCubitState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivityListener;

  ConnectivityCubit() : super(ConnectivityCubitState.Initial) {
    connectivityListener = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(ConnectivityCubitState.Connected);
      } else {
        emit(ConnectivityCubitState.Disconnected);
      }
    });
  }

  @override
  Future<void> close() {
    connectivityListener?.cancel();
    return super.close();
  }
}
