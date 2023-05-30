import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:transport_app/app/ui/client/model/client_model.dart';

import 'package:transport_app/app/ui/shared/style.dart';

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
            child: SizedBox(
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(.5),
              child: Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: APPSTYLE.BLACK_COLOR.withOpacity(.4)),
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _model(cle: "Noms", valeur: client?.names),
                          _model(cle: "Genre", valeur: client?.sexe),
                          _model(cle: "Contact", valeur: client?.contact),
                          _model(cle: "E-mail", valeur: client?.email),
                        ],
                      ),
                      Center(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: QrImage(
                            foregroundColor: Colors.black,
                            data:
                                "${client!.names},${client!.email},${client!.address}",
                            version: QrVersions.auto,
                            size: 150,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ))
      ]),
    );
  }

  Widget _model({String? cle, String? valeur}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cle!,
          style: GoogleFonts.montserrat(
            fontSize: 13,
          ),
        ),
        // 15.heightBox,
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
