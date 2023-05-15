import 'package:fluent_ui/fluent_ui.dart';
import 'package:transport_app/app/ui/home/app_home.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppHome.routeName: (context) => const AppHome(),
};
