import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transport_app/app/ui/login/user_repository/user_controller.dart';
import 'package:transport_app/app/ui/home/app_home.dart';

import 'package:transport_app/app/ui/shared/style.dart';
import 'package:transport_app/app/ui/shared/widget.dart';
import 'package:transport_app/controller/bloc/bloc.dart';
import 'package:transport_app/controller/bloc/state.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AppBloc? bloc;
  AuthController? _authController;

  @override
  void initState() {
    bloc = AppBloc();
    _authController = AuthController();
    super.initState();
  }

  _submit() {
    if (_authController!.validation) {
      _authController!.submitPost(bloc!);
    }
    setState(() {
      hasSubmit = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AppBloc, AppState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is SUCCESS) {
            Navigator.pushNamed(
              context,
              AppHome.routeName,
            );
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Connexion',
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    20.heightBox,
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: 300,
                        decoration: BoxDecoration(
                          color: APPSTYLE.WHITE_COLOR,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: APPSTYLE.BLACK_COLOR.withOpacity(.2),
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 6,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Nom d\'utilisateur',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                ),
                              ),
                              10.heightBox,
                              TextForm(
                                controller: _authController!.userName,
                                hint: "Nom d'utilisateur ou adresse mail",
                                width: MediaQuery.of(context).size.width,
                                hasSubmited: hasSubmit,
                              ),
                              20.heightBox,
                              Text(
                                'Mot de passe',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                ),
                              ),
                              10.heightBox,
                              TextFormPassWord(
                                controller: _authController!.passWord,
                                hint: "Mot de passe",
                                hasSubmited: hasSubmit,
                              ),
                              30.heightBox,
                              CustomButton(
                                onTap: _submit,
                                title: "Se connecter",
                                textColor: APPSTYLE.WHITE_COLOR,
                                backgroundColor: APPSTYLE.PRIMARY_COLOR_LIGH,
                                state: state,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
