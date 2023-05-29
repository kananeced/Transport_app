import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:transport_app/app/ui/client/model/client_model.dart';

import 'package:transport_app/app/ui/shared/style.dart';
import 'package:velocity_x/velocity_x.dart';

class Carte extends StatelessWidget {
  static String routeName = "/Carte";
  final Client? client;
  const Carte({super.key, this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back,
                  color: APPSTYLE.BLACK_COLOR,
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: Center(
          child: Row(
            children: [
              Column(
                children: [
                  _model(cle: "Noms", valeur: client?.names),
                  _model(cle: "Genre", valeur: client?.sexe),
                  _model(cle: "Contact", valeur: client?.contact),
                  _model(cle: "E-mail", valeur: client?.email),
                  _model(cle: "Adresse", valeur: client?.address),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 2.3,
                width: MediaQuery.of(context).size.width / 2.3,
                child: QrImage(
                  foregroundColor: Colors.white,
                  data: "${client!.names},${client!.email},${client!.address}",
                  version: QrVersions.auto,
                  size: 150,
                ),
              ),
            ],
          ),
        ))
      ]),
    );
  }

  Widget _model({String? cle, String? valeur}) {
    return Column(
      children: [
        Text(
          cle!,
          style: GoogleFonts.montserrat(
            fontSize: 13,
          ),
        ),
        10.heightBox,
        Text(
          valeur!,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        )
      ],
    );
  }
}
