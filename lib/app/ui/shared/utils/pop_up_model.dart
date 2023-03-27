import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as mat;
import 'package:google_fonts/google_fonts.dart';
import 'package:transport_app/app/ui/shared/style.dart';

class PoppupModel extends StatefulWidget {
  final Widget? child;
  final String? text;
  const PoppupModel({super.key, this.child, this.text});

  @override
  State<PoppupModel> createState() => _PoppupModelState();
}

class _PoppupModelState extends State<PoppupModel> {
  bool hasFinished = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return mat.Material(
      color: APPSTYLE.SCAFFOLD_BACGROUND_COLOR_LIGH.withOpacity(.87),
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(50),
          padding: const EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height - 50,
          width: 500,
          decoration: BoxDecoration(
            border: Border.all(
              color: APPSTYLE.ON_CONTAINER_COLOR,
            ),
            color: APPSTYLE.WHITE_COLOR,
            borderRadius: BorderRadius.circular(10),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: APPSTYLE.SHADOW_COLOR,
                offset: const Offset(-3, 7),
                blurRadius: 7,
              ),
              BoxShadow(
                color: APPSTYLE.SHADOW_COLOR.withOpacity(.3),
                offset: const Offset(3, -7),
                blurRadius: 7,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.text!,
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  mat.InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        mat.Icons.close,
                      ),
                    ),
                  ),
                ],
              ),
              widget.child ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
