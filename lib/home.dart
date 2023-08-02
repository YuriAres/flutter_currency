import 'package:flutter/material.dart';
import 'package:flutter_currency/API.dart';
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
  List<String> moedas = ["Dólar", "Real", "Libra", "Euro"];
  String? valorE = "Real";
  String? valorF = "Dólar";
  FlagsCode iconvalue1 = FlagsCode.BR;
  FlagsCode iconvalue2 = FlagsCode.US;
  late Map? response;

  @override
  void initState() {
    super.initState();
    getDatainit();
  }

  void getDatainit() async {
    response = await APIComunication().getData();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

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
              child: response == null || response!.isEmpty
                  ? Container()
                  : Column(
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
                                    fontSize:
                                        MediaQuery.sizeOf(context).height *
                                            0.030,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.02,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("US Dólar: R\$ 0.00",
                                    style: GoogleFonts.openSans(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.sizeOf(context).height *
                                                0.027,
                                        fontWeight: FontWeight.w300)),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.01,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Euro: R\$ 0.00",
                                    style: GoogleFonts.openSans(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.sizeOf(context).height *
                                                0.027,
                                        fontWeight: FontWeight.w300)),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.01,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Libra: R\$ 0.00",
                                    style: GoogleFonts.openSans(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.sizeOf(context).height *
                                                0.027,
                                        fontWeight: FontWeight.w300)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.042,
                        ),
                        Widgets().customtextfield(
                            firstText,
                            iconvalue1,
                            MediaQuery.sizeOf(context).height * 0.046,
                            MediaQuery.sizeOf(context).width * 0.2,
                            "Insira o Valor aqui"),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.042,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Widgets().customDropDownButton(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height * 0.027,
                                valorE,
                                moedas, (selection) {
                              setState(() {
                                valorE = selection;
                                print("Valor 1: $valorE");
                                iconvalue1 = changeFlag(valorE);
                              });
                            }),
                            const Icon(
                              Icons.swap_horiz,
                              size: 42,
                              color: Color(0xff4F6367),
                            ),
                            Widgets().customDropDownButton(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height * 0.027,
                                valorF,
                                moedas, (selection) {
                              setState(() {
                                valorF = selection;
                                print("Valor 2: $valorF");
                                iconvalue2 = changeFlag(valorF);
                              });
                            }),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.042,
                        ),
                        Widgets().customtextfield(
                            firstText,
                            iconvalue2,
                            MediaQuery.sizeOf(context).height * 0.046,
                            MediaQuery.sizeOf(context).width * 0.2,
                            "0.00"),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.06,
                        ),
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.06,
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff7A9E9F),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {
                                  APIComunication().teste();
                                  print(response);
                                },
                                child: Text(
                                  "Converter",
                                  style: GoogleFonts.openSans(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.sizeOf(context).height *
                                              0.030,
                                      fontWeight: FontWeight.w500),
                                )))
                      ],
                    ))),
    );
  }
}

FlagsCode changeFlag(String? value) {
  switch (value) {
    case "Real":
      return FlagsCode.BR;
    case "Dólar":
      return FlagsCode.US;
    case "Euro":
      return FlagsCode.EU;
    case "Libra":
      return FlagsCode.GB;
    default:
      return FlagsCode.AC;
  }
}
