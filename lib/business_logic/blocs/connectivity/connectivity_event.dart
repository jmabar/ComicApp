part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object> get props => [];
}

class OnChangeConnectionStatusEvent extends ConnectivityEvent {
  final ConnectionStatus connectionStatus;
  const OnChangeConnectionStatusEvent(this.connectionStatus);
}
