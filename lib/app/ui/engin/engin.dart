import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transport_app/app/ui/engin/add_engin.dart';
import 'package:transport_app/app/ui/engin/all_engin.dart';
import 'package:transport_app/app/ui/engin/engin_repo/model_engin.dart';

import 'package:transport_app/app/ui/shared/style.dart';
import 'package:transport_app/controller/bloc/bloc.dart';
import 'package:transport_app/controller/bloc/event.dart';
import 'package:transport_app/controller/bloc/state.dart';

import 'package:velocity_x/velocity_x.dart';

class Engin extends StatefulWidget {
  const Engin({super.key});

  @override
  State<Engin> createState() => _EnginState();
}

class _EnginState extends State<Engin> {
  List<Car>? engin = [];
  AppBloc? bloc;
  @override
  void initState() {
    bloc = AppBloc();
    bloc!.add(
      GETTENGIN(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _infoBar(),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
              decoration: BoxDecoration(
                color: APPSTYLE.WHITE_COLOR,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: APPSTYLE.DESABLE_COLOR,
                            ),
                            child: Text(
                              'Tout',
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        15.widthBox,
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: APPSTYLE.DESABLE_COLOR,
                            ),
                            child: Text(
                              'Voiture',
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        15.widthBox,
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: APPSTYLE.DESABLE_COLOR,
                            ),
                            child: Text(
                              'Bus',
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  BlocBuilder<AppBloc, AppState>(
                      bloc: bloc,
                      builder: (context, state) {
                        if (state is LOADING) {
                          return const CircularProgressIndicator();
                        } else if (state is SUCCESS) {
                          engin = state.value;
                          return Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 20,
                                  right: 30,
                                  left: 10,
                                  bottom: 5,
                                ),
                                child: Wrap(
                                  spacing: 10,
                                  runSpacing: 12,
                                  children: List.generate(
                                    engin!.length,
                                    (index) => AllEngin(
                                      bloc: bloc,
                                      engin: engin![index],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else if (state is ERROR) {
                          Column(
                            children: [
                              Text(state.dueTo.toString()),
                              InkWell(
                                onTap: (() {
                                  bloc!.add(
                                    GETTENGIN(),
                                  );
                                }),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(4)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Reessayer",
                                    style: TextStyle(
                                      color: APPSTYLE.BLACK_COLOR,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      })
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _infoBar() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: APPSTYLE.WHITE_COLOR,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              'Engin',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  border: Border.all(
                    color: APPSTYLE.BORDER_COLOR,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          hintText: "Rechercher un Engin",
                          helperStyle: GoogleFonts.montserrat(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    10.widthBox,
                    Icon(
                      Iconsax.search_normal,
                      color: APPSTYLE.DESABLE_COLOR,
                      size: 16,
                    ),
                  ],
                ),
              ),
              20.widthBox,
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      barrierColor: Colors.transparent,
                      builder: ((context) => const AddEngin())).then((value) {
                    if (value == "success") {
                      bloc!.add(
                        GETTENGIN(),
                      );
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Iconsax.add,
                    color: APPSTYLE.WHITE_COLOR,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
