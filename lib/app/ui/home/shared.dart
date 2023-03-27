import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transport_app/app/ui/shared/style.dart';

import 'package:velocity_x/velocity_x.dart';

class AppPageShared {
  static Widget memu(int index) => SizedBox(
        width: 150,
        child: Text(
          menuTitle[index],
          style: GoogleFonts.montserrat(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
  static Widget menuApp({
    Function()? onPressed,
    int? selectedIndex,
    int? index,
  }) =>
      InkWell(
        onTap: onPressed,
        child: Container(
          width: 200,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: BoxDecoration(
            color: selectedIndex! == index
                ? APPSTYLE.DESABLE_COLOR.withOpacity(.4)
                : null,
            border: Border(
              left: BorderSide(
                color: selectedIndex == index
                    ? const Color.fromARGB(255, 100, 123, 227)
                    : APPSTYLE.WHITE_COLOR,
                width: 5,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                selectedIndex != index
                    ? menuIcons[index!]
                    : selectIcons[index!],
                color: selectedIndex == index
                    ? const Color.fromARGB(255, 100, 123, 227)
                    : Colors.grey,
              ),
              20.widthBox,
              Expanded(
                child: Text(
                  menuTitle[index],
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: selectedIndex == index
                        ? const Color.fromARGB(255, 100, 123, 227)
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  static List<IconData> menuIcons = [
    Iconsax.home, // enterprise// customer
    Iconsax.car, //
    Iconsax.user,
  ];

  static List<IconData> selectIcons = [
    Iconsax.home_25, // enterprise// customer
    Iconsax.car5, //
    Iconsax.user4,
  ];
  static List<String> menuTitle = [
    "Dashboard",
    "Engin",
    "Client",
  ];
}
