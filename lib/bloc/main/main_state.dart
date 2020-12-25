import 'package:equatable/equatable.dart';
import 'package:home_controller/services/app_container.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {}

class MainLoaded extends MainState {
  final AppContainer appContainer;

  const MainLoaded({this.appContainer});

  @override
  List<Object> get props => [appContainer];
}
