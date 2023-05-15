import 'package:flutter/material.dart';
import 'package:transport_app/app/ui/shared/style.dart';
import 'package:velocity_x/velocity_x.dart';

class ArchitectureApp extends StatefulWidget {
  final Widget? header;

  final Widget? content;

  const ArchitectureApp({
    Key? key,
    this.content,
    this.header,
  }) : super(key: key);

  @override
  State<ArchitectureApp> createState() => _ArchitectureAppState();
}

class _ArchitectureAppState extends State<ArchitectureApp> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.header!,
        20.widthBox,
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: APPSTYLE.DESABLE_COLOR,
            ),
            child: widget.content!,
          ),
        ),
      ],
    );
  }
}
