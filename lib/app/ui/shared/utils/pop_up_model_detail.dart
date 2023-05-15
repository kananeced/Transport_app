import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as mat;

import 'package:transport_app/app/ui/shared/style.dart';

class PopupModelDetail extends StatefulWidget {
  final Widget? child;
  final Widget? image;
  const PopupModelDetail({super.key, this.child, this.image});

  @override
  State<PopupModelDetail> createState() => _PopupModelDetailState();
}

class _PopupModelDetailState extends State<PopupModelDetail> {
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
          // margin: const EdgeInsets.all(50),
          // padding: const EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height - 100,
          width: 800,
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
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                top: 0,
                left: 400,
                child: Container(
                  height: MediaQuery.of(context).size.height - 100,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: APPSTYLE.PRIMARY_COLOR_LIGH.withAlpha(60),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: mat.InkWell(
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
                        ),
                      ),
                      Expanded(
                        child: widget.child ?? const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
              widget.image ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
