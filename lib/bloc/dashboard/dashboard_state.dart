import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoadSuccess extends DashboardState {
  final bool isOnline;
  final bool isLoading;
  final bool commandFailed;

  const DashboardLoadSuccess(
      {this.isOnline, this.isLoading, this.commandFailed});

  @override
  List<Object> get props => [isOnline, isLoading, commandFailed];

  @override
  String toString() =>
      'DashboardLoadSuccess { isOnline: $isOnline, isLoading $isLoading, commandFailed $commandFailed }';

  DashboardLoadSuccess copyWith(
      {bool isOnline, bool isLoading, bool commandFailed}) {
    return DashboardLoadSuccess(
        isOnline: isOnline ?? this.isOnline,
        isLoading: isLoading ?? this.isLoading,
        commandFailed: commandFailed ?? this.commandFailed);
  }
}
