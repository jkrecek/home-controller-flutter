import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_controller/bloc/dashboard/dashboards.dart';
import 'package:home_controller/routes.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            elevation: 0,
            backgroundColor: Colors.transparent,
            titleSpacing: 0,
            title: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.info), onPressed: () {})
              ],
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.settings);
                  })
            ],
          ),
          body: Stack(children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("Home controller",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.w500))),
            Center(
                child: state is DashboardLoadSuccess
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(100),
                            ),
                            color:
                                state.isOnline ? Colors.lightGreen : Colors.red,
                            onPressed: () {
                              BlocProvider.of<DashboardBloc>(context).add(
                                  state.isOnline
                                      ? DashboardStopDevice()
                                      : DashboardStartDevice());
                            },
                            child: SizedBox(
                                width: 170,
                                height: 200,
                                child: Icon(Icons.power_settings_new,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color,
                                    size: 100)),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                  state.isOnline
                                      ? "Press to power off"
                                      : "Press to power on",
                                  style:
                                      Theme.of(context).textTheme.headline5)),
                        ],
                      )
                    : CircularProgressIndicator())
          ]));
    });
  }
}
