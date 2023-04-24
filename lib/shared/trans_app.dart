import 'package:fluent_ui/fluent_ui.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:transport_app/app/ui/home/app_home.dart';
import 'package:transport_app/app/ui/shared/routes.dart';

import 'package:transport_app/app/ui/shared/style.dart';

import 'package:transport_app/controller/bloc/bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: FluentApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: APPSTYLE.SCAFFOLD_BACGROUND_COLOR_LIGH,
        ),
        title: "Community",
        routes: routes,
        home: const AppHome(),
      ),
    );
  }
}
