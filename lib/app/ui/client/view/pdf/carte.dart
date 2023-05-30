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
            child: SizedBox(
          child: Center(
            child: Stack(
              children: [
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: APPSTYLE.BLACK_COLOR.withOpacity(.10),
                        offset: const Offset(0, 13),
                        blurRadius: 2,
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage("assets/icons/icon.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withOpacity(.15),
                        offset: const Offset(0, 5),
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: APPSTYLE.WHITE_COLOR.withOpacity(
                      .7,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 20,
                  ),
                  height: 350,
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Center(
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Carte de Transport",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _model(cle: "Noms", valeur: client?.names),
                                _model(cle: "Genre", valeur: client?.sexe),
                                _model(cle: "Contact", valeur: client?.contact),
                                _model(cle: "E-mail", valeur: client?.email),
                              ],
                            ),
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: QrImage(
                                foregroundColor: Colors.black,
                                data:
                                    "${client!.names}\n, ${client!.email}\n, ${client!.address}",
                                version: QrVersions.auto,
                                size: 150,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          height: 1,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 100, 100, 100),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Goma Transport",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                10.heightBox,
                                Text(
                                  "Av, Alindi Q himbi",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Groupe3@gmail.com",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                10.heightBox,
                                Text(
                                  "+243976829270",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        10.heightBox,
                        Center(
                          child: Text(
                            "les autorites tant civile que militaire et celle de la police nationale sont prie d'apporte leur secour au porte de la presente en cas de neccessite",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
