import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

//Bloc to manage connectivity's state
class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  StreamSubscription? _subscription;
  ConnectivityBloc() : super(const ConnectivityState(connectionStatus: ConnectionStatus.initial)) {
    on<OnChangeConnectionStatusEvent>((event, emit) => emit(state.copyWith(connectionStatus: event.connectionStatus)));

    _subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        add(const OnChangeConnectionStatusEvent(ConnectionStatus.connected));
      } else {
        add(const OnChangeConnectionStatusEvent(ConnectionStatus.disconnected));
      }
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
