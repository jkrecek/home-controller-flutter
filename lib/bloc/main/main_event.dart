import 'package:equatable/equatable.dart';
import 'package:home_controller/services/app_container.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class MainAppLoaded extends MainEvent {
  final AppContainer appContainer;

  const MainAppLoaded({this.appContainer});

  @override
  List<Object> get props => [appContainer];
}
