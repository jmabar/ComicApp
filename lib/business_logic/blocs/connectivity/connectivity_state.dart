part of 'connectivity_bloc.dart';

enum ConnectionStatus { initial, connected, disconnected }

class ConnectivityState extends Equatable {
  final ConnectionStatus connectionStatus;
  const ConnectivityState({required this.connectionStatus});

  @override
  List<Object> get props => [connectionStatus];

  ConnectivityState copyWith({ConnectionStatus? connectionStatus}) => ConnectivityState(connectionStatus: connectionStatus ?? this.connectionStatus);
}
