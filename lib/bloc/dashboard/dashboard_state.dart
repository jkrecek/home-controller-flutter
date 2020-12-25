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

  const DashboardLoadSuccess(this.isOnline, this.isLoading);

  @override
  List<Object> get props => [isOnline];

  @override
  String toString() => 'DashboardLoadSuccess { isOnline: $isOnline }';
}
