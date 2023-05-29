import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transport_app/app/ui/engin/controller/engin_controller.dart';
import 'package:transport_app/app/ui/engin/model/model_engin.dart';
import 'package:transport_app/app/ui/shared/style.dart';
import 'package:transport_app/app/ui/shared/utils/pop_up_model.dart';
import 'package:transport_app/app/ui/shared/widget.dart';
import 'package:transport_app/controller/bloc/bloc.dart';
import 'package:transport_app/controller/bloc/state.dart';
import 'package:velocity_x/velocity_x.dart';

class EditEngin extends StatefulWidget {
  final Car? engin;
  const EditEngin({super.key, this.engin});

  @override
  State<EditEngin> createState() => _EditEnginState();
}

class _EditEnginState extends State<EditEngin> {
  final EnginController _enginController = EnginController();

  AppBloc? bloc;
  String?
      dropDownValue; // this will be removed while we will create the controller view
  List<String> dropDownValues = ["voiture", "bus"];
  @override
  void initState() {
    bloc = AppBloc();
    super.initState();

    dropDownValue = widget.engin!.category!.designation;
    _enginController.marque!.text = widget.engin!.marque!;
    _enginController.model!.text = widget.engin!.model!;
    _enginController.nemeroplaque!.text = widget.engin!.numeroplaque!;
    _enginController.numerochassie!.text = widget.engin!.numerochassie!;
  }

  _submit() {
    if (dropDownValue == "voiture") {
      if (_enginController.validation) {
        _enginController.categorie = 1;
        _enginController.submitPutEngin(bloc!);
      }
      setState(() {
        hasSubmit = true;
      });
    } else if (dropDownValue == "bus") {
      if (_enginController.validation) {
        _enginController.categorie = 2;
        _enginController.submitPutEngin(bloc!);
      }
      setState(() {
        hasSubmit = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is SUCCESS) {
          Navigator.pop(context, "success");
        } else if (state is ERROR) {
          CherryToast.error(
            title: const Text('Error'),
            enableIconAnimation: false,
            displayTitle: false,
            description: Text(state.dueTo!),
            animationType: AnimationType.fromRight,
            animationDuration: const Duration(milliseconds: 1000),
            autoDismiss: true,
          ).show(context);
        }
      },
      child: BlocBuilder<AppBloc, AppState>(
          bloc: bloc,
          builder: (context, state) {
            return IgnorePointer(
              ignoring: state is LOADING,
              child: PoppupModel(
                text: 'Ajout Engin',
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Categorie',
                                  style: APPSTYLE.body2,
                                ),
                                10.heightBox,
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 1,
                                      color: APPSTYLE.BORDER_COLOR,
                                    ),
                                  ),
                                  child: DropdownButton<String>(
                                    value: dropDownValue,
                                    borderRadius: BorderRadius.circular(4),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      size: 20,
                                    ),
                                    underline: Container(),
                                    isDense: true,
                                    items: List.generate(dropDownValues.length,
                                            (index) => dropDownValues[index])
                                        .map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: SizedBox(
                                          width: 420,
                                          child: Text(
                                            items,
                                            style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropDownValue = newValue;
                                      });
                                    },
                                  ),
                                ),
                                20.heightBox,
                                Text(
                                  'Marque',
                                  style: APPSTYLE.body2,
                                ),
                                10.heightBox,
                                TextForm(
                                  controller: _enginController.marque,
                                  hint: 'Entre la marque',
                                  hasSubmited: hasSubmit,
                                ),
                                20.heightBox,
                                Text(
                                  'Model',
                                  style: APPSTYLE.body2,
                                ),
                                10.heightBox,
                                TextForm(
                                  controller: _enginController.model,
                                  hint: 'Entre le model',
                                  hasSubmited: hasSubmit,
                                ),
                                20.heightBox,
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Numéro Plaque',
                                            style: APPSTYLE.body2,
                                          ),
                                          10.heightBox,
                                          TextForm(
                                            controller:
                                                _enginController.nemeroplaque,
                                            width: 220,
                                            hint: '000 0000',
                                            hasSubmited: hasSubmit,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Numéro Chassie',
                                          style: APPSTYLE.body2,
                                        ),
                                        10.heightBox,
                                        TextForm(
                                          controller:
                                              _enginController.numerochassie,
                                          width: 220,
                                          hint: '000 0000',
                                          hasSubmited: hasSubmit,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '*Insertion  d\'un Engin',
                              style: APPSTYLE.body2,
                            ),
                          ),
                          CustomButton(
                            onTap: _submit,
                            title: 'Modifier',
                            textColor: APPSTYLE.WHITE_COLOR,
                            backgroundColor: APPSTYLE.PRIMARY_COLOR_LIGH,
                            width: 220,
                            state: state,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
