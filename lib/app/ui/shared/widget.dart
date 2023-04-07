import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transport_app/app/ui/shared/style.dart';
import 'package:transport_app/controller/bloc/state.dart';
import 'package:velocity_x/velocity_x.dart';

class TextForm extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final double? width;
  final int? maxLine;

  const TextForm({
    super.key,
    this.hint,
    this.controller,
    this.width,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: APPSTYLE.BORDER_COLOR,
        ),
      ),
      child: TextField(
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.black,
        ),
        maxLines: maxLine,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          hintText: hint,
          hintStyle: GoogleFonts.montserrat(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class TextFormPassWord extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  const TextFormPassWord({super.key, this.hint, this.controller});

  @override
  State<TextFormPassWord> createState() => _TextFormPassWordState();
}

class _TextFormPassWordState extends State<TextFormPassWord> {
  ValueNotifier<bool> isObscure = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: APPSTYLE.DESABLE_COLOR,
        ),
      ),
      child: ValueListenableBuilder(
          valueListenable: isObscure,
          builder: (context, bool isObscureText, child) {
            return Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    controller: widget.controller,
                    obscureText: isObscureText,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: widget.hint,
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                10.widthBox,
                InkWell(
                  onTap: () {
                    isObscure.value = !isObscure.value;
                  },
                  child: Icon(
                    isObscureText ? Iconsax.eye : Iconsax.eye_slash,
                    size: 16,
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String? title;
  final Color? textColor;
  final Color? backgroundColor;
  final Function()? onTap;
  final double? width;

  final AppState? state;
  const CustomButton({
    super.key,
    required this.title,
    this.textColor,
    this.backgroundColor,
    this.onTap,
    this.width,
    this.state,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        width: width,
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            state is LOADING
                ? SizedBox(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(
                      color: APPSTYLE.WHITE_COLOR,
                    ),
                  )
                : Text(
                    "$title",
                    style: GoogleFonts.montserrat(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
