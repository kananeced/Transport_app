import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transport_app/app/providers/engin/model_engin.dart';

import 'package:transport_app/app/ui/shared/style.dart';
import 'package:transport_app/app/ui/shared/utils/pop_up_model_detail.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailEngin extends StatefulWidget {
  final Car? engin;
  const DetailEngin({super.key, this.engin});

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
              widget.engin!.designation!,
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
              widget.engin!.marque!,
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
              widget.engin!.model!,
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
              widget.engin!.nemeroplaque!,
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
              widget.engin!.numerochassie!,
              style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
