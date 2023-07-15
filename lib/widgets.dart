import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Widgets {
  Widget customtextfield(TextEditingController control, FlagsCode icon,
      double heightIcon, double widthIcon, String hinttext) {
    return TextField(
      textAlign: TextAlign.right,
      style: GoogleFonts.openSans(fontSize: 21),
      keyboardType: const TextInputType.numberWithOptions(),
      controller: control,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          prefixIcon: Flag.fromCode(
            icon,
            height: 1,
            width: 1,
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: widthIcon,
            minHeight: heightIcon,
          ),
          labelStyle: GoogleFonts.openSans(color: Colors.grey[700]),
          hintText: hinttext,
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1.2, color: Color(0xff4F6367)),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1.2, color: Color(0xff4F6367)),
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
