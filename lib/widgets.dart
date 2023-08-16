import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Widgets {
  Widget customtextfield(TextEditingController control, FlagsCode icon,
      double heightIcon, double widthIcon, String hinttext, bool status) {
    return TextField(
      textAlign: TextAlign.right,
      style: GoogleFonts.openSans(fontSize: 21),
      keyboardType: const TextInputType.numberWithOptions(),
      controller: control,
      enabled: status,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
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
              borderRadius: BorderRadius.circular(10)),
          disabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1.2, color: Color(0xff4F6367)),
              borderRadius: BorderRadius.circular(10))),
    );
  }

  Widget customDropDownButton(
      double valueWidth,
      double valueFont,
      String? selectedValue,
      List<String> moedas,
      Function(String? selection) func) {
    return SizedBox(
      width: valueWidth * 0.32,
      child: DropdownButtonFormField(
          isExpanded: true,
          dropdownColor: const Color(0xffB8D8D8),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1.2, color: Color(0xff4F6367)),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1.2, color: Color(0xff4F6367)),
                  borderRadius: BorderRadius.circular(10))),
          icon: const Icon(
            Icons.expand_more,
            size: 30,
          ),
          value: selectedValue,
          items: moedas
              .map((opcoes) => DropdownMenuItem(
                  value: opcoes,
                  child: Center(
                      child: Text(opcoes,
                          style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontSize: valueFont,
                              fontWeight: FontWeight.w300)))))
              .toList(),
          onChanged: func),
    );
  }
}
