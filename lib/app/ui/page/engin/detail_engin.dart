import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:transport_app/app/ui/shared/style.dart';
import 'package:transport_app/app/ui/shared/utils/pop_up_model_detail.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailEngin extends StatefulWidget {
  const DetailEngin({super.key});

  @override
  State<DetailEngin> createState() => _DetailEnginState();
}

class _DetailEnginState extends State<DetailEngin> {
  @override
  Widget build(BuildContext context) {
    return PopupModelDetail(
        image: Container(
          width: 500,
          height: 500,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/svg/car.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categirie',
              style: APPSTYLE.header2,
            ),
            10.heightBox,
            Text(
              'Voiture',
              style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            20.heightBox,
            Text(
              'Marque',
              style: APPSTYLE.header2,
            ),
            10.heightBox,
            Text(
              'Toyota',
              style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            20.heightBox,
            Text(
              'Modèle',
              style: APPSTYLE.header2,
            ),
            10.heightBox,
            Text(
              'Noah',
              style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            20.heightBox,
            Text(
              'Numéro Plaque',
              style: APPSTYLE.header2,
            ),
            10.heightBox,
            Text(
              '00889YGY',
              style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            20.heightBox,
            Text(
              'Numéro Chassie',
              style: APPSTYLE.header2,
            ),
            10.heightBox,
            Text(
              '00889YGY',
              style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
