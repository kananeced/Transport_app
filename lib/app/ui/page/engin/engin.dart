import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transport_app/app/ui/page/engin/add_engin.dart';
import 'package:transport_app/app/ui/page/engin/detail_engin.dart';
import 'package:transport_app/app/ui/page/engin/edit_engin.dart';
import 'package:transport_app/app/ui/shared/style.dart';

import 'package:velocity_x/velocity_x.dart';

class Engin extends StatefulWidget {
  const Engin({super.key});

  @override
  State<Engin> createState() => _EnginState();
}

class _EnginState extends State<Engin> {
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
                  Expanded(
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
                            15,
                            (index) => cardVehicule(),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget cardVehicule() {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            barrierColor: Colors.transparent,
            builder: ((context) => const DetailEngin()));
      },
      child: Container(
        height: 150,
        width: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: APPSTYLE.WHITE_COLOR,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: APPSTYLE.ON_CONTAINER_COLOR.withOpacity(.7),
              offset: const Offset(3, 3),
              blurRadius: 6,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Stack(
          children: [
            Row(children: [
              Container(
                width: 120,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/svg/car.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    top: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Taxi Voiture',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      10.heightBox,
                      Expanded(
                        child: Text(
                          'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        'Voiture',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                        ),
                      ),
                      10.heightBox,
                    ],
                  ),
                ),
              ),
            ]),
            Positioned(
              bottom: 10,
              left: 220,
              child: modelAction(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierColor: Colors.transparent,
                    builder: ((context) => const EditEngin()),
                  );
                },
                icon: Iconsax.edit,
                color: APPSTYLE.PRIMARY_COLOR_LIGH,
              ),
            ),
          ],
        ),
      ),
    );
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
                      builder: ((context) => const AddEngin()));
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
