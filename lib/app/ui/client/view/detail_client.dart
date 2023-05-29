import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transport_app/app/ui/client/model/client_model.dart';
import 'package:transport_app/app/ui/shared/style.dart';

import 'package:transport_app/app/ui/shared/utils/pop_up_model.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailClient extends StatelessWidget {
  final List<Payments> payments;
  const DetailClient({super.key, required this.payments});

  @override
  Widget build(BuildContext context) {
    return PoppupModel(
        text: "Historique de Paiement",
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 200,
            // decoration: BoxDecoration(
            //   border: Border.all(),
            //   borderRadius: BorderRadius.circular(4),
            // ),
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  payments.length,
                  (index) => _AllPayement(payments: payments[index]),
                ),
              ),
            )));
  }
}

class _AllPayement extends StatelessWidget {
  final Payments payments;
  const _AllPayement({required this.payments});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formatDate(DateTime.parse(payments.createdAt!), [
                  dd,
                  '-',
                  mm,
                  '-',
                  yyyy,
                ]),
                textAlign: TextAlign.end,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              _model(cle: "Marque", valeur: payments.engins!.marque),
              10.heightBox,
              _model(cle: "N° Plaque", valeur: payments.engins!.numeroplaque),
              10.heightBox,
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: APPSTYLE.DESABLE_COLOR)),
              ),
              10.heightBox,
              _model(cle: "Model", valeur: payments.engins!.model),
              10.heightBox,
              _model(cle: "N° Chassie", valeur: payments.engins!.numerochassie),
              10.heightBox,
              _model(cle: "Montant Payer", valeur: payments.amount),
              10.heightBox,
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: APPSTYLE.BLACK_COLOR.withOpacity(.4))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _model({String? cle, String? valeur}) {
    return Row(
      children: [
        Text(
          cle!,
          style: GoogleFonts.montserrat(
            fontSize: 13,
          ),
        ),
        const Expanded(child: SizedBox()),
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
