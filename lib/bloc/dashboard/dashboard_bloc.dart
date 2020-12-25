import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_controller/bloc/dashboard/dashboard_event.dart';
import 'package:home_controller/bloc/dashboard/dashboard_state.dart';
import 'package:home_controller/services/app_container.dart';
import 'package:home_controller/services/services.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  AppContainer appContainer;

  DashboardBloc({this.appContainer}) : super(DashboardInitial()) {
    listenOnlineState();
  }

  ApiService get apiService {
    return appContainer.apiService;
  }

  void listenOnlineState() {
    apiService.listenStatusStream().listen((status) {
      add(DashboardLoaded(isOnline: status.isOnline));
    });
  }

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is DashboardLoaded) {
      yield* _mapDashboardLoadedToState(event);
    } else if (event is DashboardStartDevice) {
      yield* _mapDashboardStartDeviceToState(event);
    } else if (event is DashboardStopDevice) {
      yield* _mapDashboardStopDeviceToState(event);
    }
  }

  Stream<DashboardState> _mapDashboardLoadedToState(
      DashboardLoaded event) async* {
    yield DashboardLoadSuccess(event.isOnline, false);
  }

  Stream<DashboardState> _mapDashboardStartDeviceToState(
      DashboardStartDevice event) async* {
    assert(state is DashboardLoadSuccess);
    yield DashboardLoadSuccess((state as DashboardLoadSuccess).isOnline, true);
    apiService.wake();
  }

  Stream<DashboardState> _mapDashboardStopDeviceToState(
      DashboardStopDevice event) async* {
    assert(state is DashboardLoadSuccess);
    yield DashboardLoadSuccess((state as DashboardLoadSuccess).isOnline, true);
    apiService.halt();
  }
}
