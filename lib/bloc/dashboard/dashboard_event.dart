import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class DashboardLoaded extends DashboardEvent {
  final bool isOnline;

  const DashboardLoaded({@required this.isOnline});

  @override
  List<Object> get props => [isOnline];
}

class DashboardStartDevice extends DashboardEvent {
  const DashboardStartDevice();
}

class DashboardStopDevice extends DashboardEvent {
  const DashboardStopDevice();
}
