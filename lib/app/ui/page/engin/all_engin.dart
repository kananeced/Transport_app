import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transport_app/app/providers/engin/model_engin.dart';
import 'package:transport_app/app/ui/page/engin/detail_engin.dart';
import 'package:transport_app/app/ui/page/engin/edit_engin.dart';
import 'package:transport_app/app/ui/shared/style.dart';
import 'package:transport_app/controller/bloc/bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class AllEngin extends StatelessWidget {
  final AppBloc? bloc;
  final Car? engin;
  const AllEngin({
    super.key,
    required this.bloc,
    required this.engin,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            barrierColor: Colors.transparent,
            builder: ((context) => DetailEngin(
                  engin: engin,
                )));
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
                        engin!.designation!,
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      10.heightBox,
                      Expanded(
                        child: Text(
                          engin!.model!,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        engin!.nemeroplaque!,
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
}
