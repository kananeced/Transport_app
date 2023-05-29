import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transport_app/app/ui/client/model/client_model.dart';
import 'package:transport_app/app/ui/client/view/detail_client.dart';
import 'package:transport_app/app/ui/client/view/pdf/carte.dart';

import 'package:transport_app/app/ui/shared/style.dart';
import 'package:transport_app/controller/bloc/bloc.dart';
import 'package:transport_app/controller/bloc/event.dart';
import 'package:transport_app/controller/bloc/state.dart';
import 'package:velocity_x/velocity_x.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  AppBloc? bloc;
  List<Client> client = [];

  @override
  void initState() {
    bloc = AppBloc();
    bloc!.add(GETTCLIENT());
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
              decoration: BoxDecoration(
                color: APPSTYLE.WHITE_COLOR,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tabHeader(context: context),
                  Expanded(
                      child: BlocBuilder<AppBloc, AppState>(
                    bloc: bloc,
                    builder: ((context, state) {
                      if (state is LOADING) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is SUCCESS) {
                        client = state.value;
                        return SingleChildScrollView(
                          child: Column(
                            children: List.generate(
                              client.length,
                              (index) => _TabClient(
                                index: index,
                                client: client[index],
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
                                  GETTCLIENT(),
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
                    }),
                  ))
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
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
              'Client',
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
                          hintText: "Rechercher un client",
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
            ],
          ),
        ],
      ),
    );
  }

  Widget tabHeader({required BuildContext context}) {
    double space = 10;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: tabHeaderDetailModel(
              title: '#Num',
            ),
          ),
          space.widthBox,
          Expanded(
            flex: 1,
            child: tabHeaderDetailModel(
              title: 'Nom Complet',
            ),
          ),
          space.widthBox,
          Expanded(
            flex: 1,
            child: tabHeaderDetailModel(
              title: 'Sexe',
            ),
          ),
          Expanded(
            flex: 1,
            child: tabHeaderDetailModel(
              title: 'Contact',
            ),
          ),
          space.widthBox,
          Expanded(
            flex: 1,
            child: tabHeaderDetailModel(
              title: 'Adresse',
            ),
          ),
          Expanded(
            flex: 1,
            child: tabHeaderDetailModel(
              title: 'Email',
            ),
          ),
          space.widthBox,
          space.widthBox,
          Expanded(
            flex: 1,
            child: tabHeaderDetailModel(
              title: 'Action',
            ),
          ),
          space.widthBox,
        ],
      ),
    );
  }

  Widget tabHeaderDetailModel({String? title}) {
    return Text(
      title!,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
  }
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
          spacer,
          Expanded(
            flex: 1,
            child: clientModel(title: "${client.email}"),
          ),
          spacer,
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  modelAction(
                      onTap: () {
                        showDialog(
                            context: context,
                            barrierColor: Colors.transparent,
                            builder: ((context) => DetailClient(
                                  payments: client.payments!,
                                )));
                      },
                      icon: Icons.view_agenda),
                  spacer,
                  modelAction(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Carte(
                            client: client,
                          );
                        }));
                      },
                      icon: Icons.print,
                      color: APPSTYLE.PRIMARY_COLOR_DARK),
                ],
              )),
          spacer,
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
