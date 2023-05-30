import 'package:fluent_ui/fluent_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transport_app/app/ui/client/client.dart';
import 'package:transport_app/app/ui/dashbord/dashboard.dart';

import 'package:transport_app/app/ui/engin/views/engin.dart';
import 'package:transport_app/app/ui/home/app_architecture.dart';
import 'package:transport_app/app/ui/home/shared.dart';

import 'package:transport_app/app/ui/shared/style.dart';

import 'package:transport_app/controller/bloc/bloc.dart';
import 'package:transport_app/controller/bloc/event.dart';
import 'package:transport_app/controller/bloc/state.dart';
import 'package:velocity_x/velocity_x.dart';

class AppHome extends StatefulWidget {
  static String routeName = '/AppHome';
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  AppBloc? menuBloc;
  @override
  void initState() {
    menuBloc = AppBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppBloc, AppState>(
          bloc: menuBloc,
          builder: (context, state) {
            int nemuIndex = 0;
            if (state is SUCCESS) {
              nemuIndex = state.value;
            }
            return ArchitectureApp(
              header: AnimatedContainer(
                duration: const Duration(
                  milliseconds: 100,
                ),
                decoration: BoxDecoration(
                  color: APPSTYLE.WHITE_COLOR,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: Column(
                  children: [
                    30.heightBox,
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: APPSTYLE.DESABLE_COLOR,
                        image: const DecorationImage(
                          image: AssetImage("assets/icons/icon.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    60.heightBox,
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            AppPageShared.menuIcons.length,
                            (index) => AppPageShared.menuApp(
                              index: index,
                              selectedIndex: nemuIndex,
                              onPressed: () {
                                menuBloc!.add(CHANGEMENU(index));
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Iconsax.logout,
                            ),
                            10.widthBox,
                            Text(
                              'Se deconecter',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    30.widthBox,
                  ],
                ),
              ),
              content: NavigationBody(
                index: nemuIndex,
                children: const [
                  Dashboard(),
                  Engin(),
                  ClientPage(),
                ],
              ),
            );
          }),
    );
  }
}
