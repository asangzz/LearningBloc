import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

//we add the events and emits the states

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivityListenner;

  ConnectivityBloc() : super(ConnectivityInitialState()) {
    on<ConnectivityEnabledEvent>(
        (event, emit) => emit(ConnectivityEnabledState()));

    on<ConnectivityDisabledEvent>(
        (event, emit) => emit(ConnectivityDisabledState()));

    connectivityListenner =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(ConnectivityEnabledEvent());
      } else {
        add(ConnectivityDisabledEvent());
      }
    });
  }

  @override
  Future<void> close() {
    connectivityListenner?.cancel();
    return super.close();
  }
}
