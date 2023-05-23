import 'package:fluent_ui/fluent_ui.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transport_app/app/ui/login/views/login.dart';

import 'package:transport_app/app/ui/shared/routes.dart';

import 'package:transport_app/app/ui/shared/style.dart';

import 'package:transport_app/controller/bloc/bloc.dart';
import 'package:transport_app/service/prefs/app_prefs.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    _initPrefs();
    super.initState();
  }

  void _initPrefs() async {
    AppPref.prefs = await SharedPreferences.getInstance();
  }

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
        home: const LoginPage(),
      ),
    );
  }
}
