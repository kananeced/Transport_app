// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transport_app/app/ui/client/model/client_model.dart';
import 'package:transport_app/app/ui/engin/model/model_engin.dart';

import 'package:transport_app/app/ui/shared/style.dart';
import 'package:transport_app/controller/bloc/bloc.dart';
import 'package:transport_app/controller/bloc/event.dart';
import 'package:transport_app/controller/bloc/state.dart';
import 'package:velocity_x/velocity_x.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Car>? engin = [];
  List<Client> client = [];
  var nombrecar;
  var nombrebus;
  AppBloc? bloc;
  AppBloc? blocA;
  @override
  void initState() {
    bloc = AppBloc();
    bloc!.add(
      GETTENGIN(),
    );
    blocA = AppBloc();
    blocA!.add(GETTCLIENT());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _infoBar(),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width - 200,
                decoration: BoxDecoration(
                  color: APPSTYLE.WHITE_COLOR,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Column(
                    children: [
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 50,
                        runSpacing: 12,
                        children: [
                          BlocBuilder<AppBloc, AppState>(
                              bloc: bloc,
                              builder: (context, state) {
                                if (state is SUCCESS) {
                                  engin = state.value;

                                  nombrecar = engin!.count(
                                      (element) => element.categoryId == 1);

                                  nombrebus = engin!.count(
                                      (element) => element.categoryId == 2);

                                  return Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: 50,
                                      runSpacing: 12,
                                      children: [
                                        cardDashboard(
                                            nbrCar: nombrebus!.toString(),
                                            description: 'des taxis bus',
                                            icon: Iconsax.car),
                                        cardDashboard(
                                            nbrCar: nombrecar!.toString(),
                                            description: 'des taxis voiture',
                                            icon: Iconsax.car)
                                      ]);
                                }

                                return const SizedBox.shrink();
                              }),
                          BlocBuilder<AppBloc, AppState>(
                              bloc: blocA,
                              builder: (context, state) {
                                if (state is SUCCESS) {
                                  client = state.value;
                                  return cardDashboard(
                                      nbrCar: client.length.toString(),
                                      description: 'des utilisateurs',
                                      icon: Iconsax.user4);
                                }
                                return const SizedBox.shrink();
                              }),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Wrap(
                        children: [
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width - 200) / 2.2,
                            height: 400,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Quelques Engins',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: APPSTYLE.BLACK_COLOR,
                                  ),
                                ),
                                10.heightBox,
                                tabHeaderEngin(context: context),
                                Expanded(
                                  child: BlocBuilder<AppBloc, AppState>(
                                      bloc: bloc,
                                      builder: (context, state) {
                                        if (state is LOADING) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else if (state is SUCCESS) {
                                          engin = state.value;
                                          return SingleChildScrollView(
                                            child: Column(
                                              children: List.generate(
                                                engin!.length,
                                                (index) => someCar(
                                                  index: index,
                                                  context: context,
                                                  engin: engin![index],
                                                ),
                                              ),
                                            ),
                                          );
                                        }

                                        return const SizedBox.shrink();
                                      }),
                                )
                              ],
                            ),
                          ),
                          10.widthBox,
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width - 200) / 2.2,
                            height: 400,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Quelques Clients',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: APPSTYLE.BLACK_COLOR,
                                  ),
                                ),
                                10.heightBox,
                                tabHeaderClient(context: context),
                                Expanded(
                                  child: BlocBuilder<AppBloc, AppState>(
                                      bloc: blocA,
                                      builder: (context, state) {
                                        if (state is LOADING) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else if (state is SUCCESS) {
                                          client = state.value;

                                          clientNumber = client.length;

                                          return SingleChildScrollView(
                                            child: Column(
                                              children: List.generate(
                                                client.length,
                                                (index) => someClient(
                                                    index: index,
                                                    context: context,
                                                    client: client[index]),
                                              ),
                                            ),
                                          );
                                        }
                                        return const SizedBox.shrink();
                                      }),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _infoBar() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: APPSTYLE.WHITE_COLOR,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              'Dashboard',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardDashboard({String? nbrCar, String? description, IconData? icon}) {
    return Stack(
      children: [
        ClipPath(
          clipper: CustomClipPath(),
          child: Container(
            height: 150,
            width: 260,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: APPSTYLE.PRIMARY_COLOR_DARK,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  nbrCar!,
                  style: GoogleFonts.montserrat(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: APPSTYLE.WHITE_COLOR,
                  ),
                ),
                Text(
                  description!,
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: APPSTYLE.WHITE_COLOR,
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 200,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: APPSTYLE.WHITE_COLOR),
              color: APPSTYLE.WHITE_COLOR,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: APPSTYLE.SHADOW_COLOR.withOpacity(.7),
                  offset: const Offset(-3, 3),
                  blurRadius: 6,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(
              icon,
              color: APPSTYLE.PRIMARY_COLOR_DARK,
            ),
          ),
        )
      ],
    );
  }

  Widget tabHeaderEngin({required BuildContext context}) {
    double space = 10;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: tabHeaderDetaillModel(
              title: '#Num',
            ),
          ),
          space.widthBox,
          Expanded(
            flex: 2,
            child: tabHeaderDetaillModel(
              title: 'Categorie',
            ),
          ),
          space.widthBox,
          Expanded(
            flex: 1,
            child: tabHeaderDetaillModel(
              title: 'Marque',
            ),
          ),
          space.widthBox,
          Expanded(
            flex: 1,
            child: tabHeaderDetaillModel(
              title: 'Modele',
            ),
          ),
          space.widthBox,
          Expanded(
            flex: 1,
            child: tabHeaderDetaillModel(
              title: 'Plaque',
            ),
          ),
          space.widthBox,
        ],
      ),
    );
  }

  Widget someCar({
    int? index,
    BuildContext? context,
    final Car? engin,
  }) {
    Widget spacer = 15.widthBox;
    return InkWell(
      onTap: () {
        // showDialog(
        //     context: context,
        //     barrierColor: Colors.transparent,
        //     builder: ((context) => const DetailPaiement()));
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 60,
          right: 60,
          bottom: 15,
          top: 15,
        ),
        width: MediaQuery.of(context!).size.width,
        decoration: BoxDecoration(
          color: index! % 2 == 0
              ? APPSTYLE.DESABLE_COLOR.withOpacity(.4)
              : Colors.transparent,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: ligneModel(
                title: "00${index + 1}",
              ),
            ),
            spacer,
            Expanded(
              flex: 2,
              child: ligneModel(title: engin!.category!.designation),
            ),
            spacer,
            Expanded(
              flex: 1,
              child: ligneModel(title: engin.marque),
            ),
            spacer,
            Expanded(
              flex: 1,
              child: ligneModel(title: engin.model),
            ),
            spacer,
            spacer,
            Expanded(
              flex: 1,
              child: ligneModel(title: engin.numeroplaque),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabHeaderClient({required BuildContext context}) {
    double space = 10;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: tabHeaderDetaillModel(
              title: '#Num',
            ),
          ),
          space.widthBox,
          Expanded(
            flex: 2,
            child: tabHeaderDetaillModel(
              title: 'Nom Complet',
            ),
          ),
          space.widthBox,
          Expanded(
            flex: 1,
            child: tabHeaderDetaillModel(
              title: 'Genre',
            ),
          ),
          space.widthBox,
          Expanded(
            flex: 1,
            child: tabHeaderDetaillModel(
              title: 'Contact',
            ),
          ),
          space.widthBox,
          Expanded(
            flex: 1,
            child: tabHeaderDetaillModel(
              title: 'Adresse',
            ),
          ),
          space.widthBox,
        ],
      ),
    );
  }

  Widget someClient({
    int? index,
    BuildContext? context,
    Client? client,
  }) {
    Widget spacer = 15.widthBox;
    return InkWell(
      onTap: () {
        // showDialog(
        //     context: context,
        //     barrierColor: Colors.transparent,
        //     builder: ((context) => const DetailPaiement()));
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 60,
          right: 60,
          bottom: 15,
          top: 15,
        ),
        width: MediaQuery.of(context!).size.width,
        decoration: BoxDecoration(
          color: index! % 2 == 0
              ? APPSTYLE.DESABLE_COLOR.withOpacity(.4)
              : Colors.transparent,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: ligneModel(
                title: "00${index + 1}",
              ),
            ),
            spacer,
            Expanded(
              flex: 2,
              child: ligneModel(title: client!.names),
            ),
            spacer,
            Expanded(
              flex: 1,
              child: ligneModel(title: client.sexe),
            ),
            spacer,
            Expanded(
              flex: 1,
              child: ligneModel(title: client.contact),
            ),
            spacer,
            spacer,
            Expanded(
              flex: 1,
              child: ligneModel(title: client.address),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabHeaderDetaillModel({String? title}) {
    return Text(
      title!,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
  }

  Widget ligneModel({String? title}) {
    return Text(
      title!,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: GoogleFonts.montserrat(
        fontSize: 12,
        color: APPSTYLE.BLACK_COLOR,
        height: 1.5,
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  double radius = 20;

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(radius, 0)
      ..lineTo(size.width - 60, 0)
      ..arcToPoint(
        Offset(size.width, 60),
        radius: const Radius.elliptical(10, 10),
        clockwise: false,
      )
      ..lineTo(size.width, size.height - radius)
      ..arcToPoint(
        Offset(size.width - radius, size.height),
        radius: Radius.circular(radius),
      )
      ..lineTo(radius, size.height)
      ..arcToPoint(
        Offset(radius - size.height, size.width),
        radius: const Radius.circular(20),
      )
      ..lineTo(radius - size.height, 0)
      ..arcToPoint(Offset(radius, 0), radius: const Radius.circular(20))
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _TabClient extends StatelessWidget {
  final int index;
  final Client client;
  const _TabClient({
    required this.client,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Widget spacer = 15.widthBox;
    return Container(
      padding: const EdgeInsets.only(
        left: 60,
        right: 60,
        bottom: 15,
        top: 15,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: index % 2 == 0
            ? APPSTYLE.DESABLE_COLOR.withOpacity(.4)
            : Colors.transparent,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: clientModel(
              title: "00${index + 1}",
            ),
          ),
          spacer,
          Expanded(
            flex: 1,
            child: clientModel(title: "${client.names}"),
          ),
          Expanded(
            flex: 1,
            child: clientModel(title: "${client.sexe}"),
          ),
          spacer,
          Expanded(
            flex: 1,
            child: clientModel(title: "${client.contact}"),
          ),
          spacer,
          Expanded(
            flex: 1,
            child: clientModel(title: "${client.address}"),
          ),
        ],
      ),
    );
  }
}

Widget modelAction({
  Function()? onTap,
  IconData? icon,
  Color? color,
}) {
  return InkWell(
    onTap: onTap,
    child: Icon(
      icon,
      color: color,
    ),
  );
}

Widget clientModel({String? title}) {
  return Text(
    title!,
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
    style: GoogleFonts.montserrat(
      fontSize: 12,
      color: APPSTYLE.BLACK_COLOR,
      height: 1.5,
    ),
  );
}
