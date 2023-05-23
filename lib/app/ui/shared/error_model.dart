import 'package:flutter/material.dart';

import 'package:transport_app/app/ui/shared/style.dart';
import 'package:transport_app/app/ui/shared/widget.dart';
import 'package:transport_app/service/common_error.dart';
import 'package:velocity_x/velocity_x.dart';

errorModel(BuildContext context, {required ErrorData dueTo}) {
  return showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(
        "Erreur",
        style: TextStyle(
          color: APPSTYLE.BLACK_COLOR,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${dueTo.message}",
                style: const TextStyle(
                  height: 1.5,
                ),
              ),
              30.heightBox,
              CustomButton(
                context: context,
                backgroundColor: APPSTYLE.PRIMARY_COLOR_DARK,
                title: "Quitter",
                textColor: Colors.white,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
