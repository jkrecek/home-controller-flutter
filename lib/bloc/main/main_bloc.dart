import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_controller/services/app_container.dart';

import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    AppContainer.load()
        .then((value) => add(MainAppLoaded(appContainer: value)));
  }

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is MainAppLoaded) {
      yield* _mapAppLoadedToState(event);
    } else {
      throw UnimplementedError();
    }
  }

  Stream<MainState> _mapAppLoadedToState(MainAppLoaded event) async* {
    yield MainLoaded(appContainer: event.appContainer);
  }
}
