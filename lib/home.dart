import 'package:flutter/material.dart';
import 'package:flutter_currency/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flag/flag.dart';

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  TextEditingController firstText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4F6367),
        title: Text(
          "Conversor Monetário",
          style: GoogleFonts.openSans(
              fontSize: MediaQuery.sizeOf(context).height * 0.027),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.refresh,
                size: MediaQuery.sizeOf(context).height * 0.032,
              ))
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.fromLTRB(18, 25, 18, 0),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(color: Color(0xffB8D8D8)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(17, 12, 17, 12),
              height: MediaQuery.sizeOf(context).height * 0.23,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: const Color(0xff7A9E9F),
                  borderRadius: BorderRadius.circular(13)),
              child: Column(
                children: [
                  Text(
                    "Cotação Atual",
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: MediaQuery.sizeOf(context).height * 0.030,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("US Dólar: R\$ 0.00",
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: MediaQuery.sizeOf(context).height * 0.027,
                            fontWeight: FontWeight.w300)),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Euro: R\$ 0.00",
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: MediaQuery.sizeOf(context).height * 0.027,
                            fontWeight: FontWeight.w300)),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Libra: R\$ 0.00",
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: MediaQuery.sizeOf(context).height * 0.027,
                            fontWeight: FontWeight.w300)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.04,
            ),
            Widgets().customtextfield(
                firstText,
                FlagsCode.BR,
                MediaQuery.sizeOf(context).height * 0.046,
                MediaQuery.sizeOf(context).width * 0.2,
                "Insira o Valor aqui")
          ],
        ),
      )),
    );
  }
}
