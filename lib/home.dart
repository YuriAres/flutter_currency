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
  TextEditingController secondText = TextEditingController();
  List<String> moedas = ["USD", "BRL", "GBP", "EUR"];
  String? valorE = "BRL";
  String? valorF = "USD";
  FlagsCode iconvalue1 = FlagsCode.BR;
  FlagsCode iconvalue2 = FlagsCode.US;
  late Future<Map> map;
  double dolar = 0;
  double euro = 0;
  double libra = 0;

  @override
  void initState() {
    super.initState();
    map = APIComunication().getData();
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
              child: FutureBuilder(
                  future: map,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                            child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.07,
                          width: MediaQuery.sizeOf(context).height * 0.07,
                          child: const CircularProgressIndicator(
                            strokeWidth: 5,
                            color: Color(0xff4F6367),
                          ),
                        ));
                      default:
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text("Erro!"),
                          );
                        } else {
                          dolar = double.parse(snapshot.data!['results']
                                  ['currencies']['USD']['buy']
                              .toString());
                          euro = double.parse(snapshot.data!['results']
                                  ['currencies']['EUR']['buy']
                              .toString());
                          libra = double.parse(snapshot.data!['results']
                                  ['currencies']['GBP']['buy']
                              .toString());
                          return Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(17, 12, 17, 12),
                                height:
                                    MediaQuery.sizeOf(context).height * 0.23,
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
                                          fontSize: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.030,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.02,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "US Dólar: R\$ ${dolar.toStringAsFixed(2)}",
                                          style: GoogleFonts.openSans(
                                              color: Colors.white,
                                              fontSize:
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.027,
                                              fontWeight: FontWeight.w300)),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.01,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "Euro: R\$ ${euro.toStringAsFixed(2)}",
                                          style: GoogleFonts.openSans(
                                              color: Colors.white,
                                              fontSize:
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.027,
                                              fontWeight: FontWeight.w300)),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.01,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "Libra: R\$ ${libra.toStringAsFixed(2)}",
                                          style: GoogleFonts.openSans(
                                              color: Colors.white,
                                              fontSize:
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.027,
                                              fontWeight: FontWeight.w300)),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.042,
                              ),
                              Widgets().customtextfield(
                                  firstText,
                                  iconvalue1,
                                  MediaQuery.sizeOf(context).height * 0.046,
                                  MediaQuery.sizeOf(context).width * 0.2,
                                  "Insira o Valor aqui",
                                  true),
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.042,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                height:
                                    MediaQuery.sizeOf(context).height * 0.042,
                              ),
                              Widgets().customtextfield(
                                  secondText,
                                  iconvalue2,
                                  MediaQuery.sizeOf(context).height * 0.046,
                                  MediaQuery.sizeOf(context).width * 0.2,
                                  "0.00",
                                  false),
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.06,
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.06,
                                  width: MediaQuery.sizeOf(context).width * 0.7,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xff7A9E9F),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      onPressed: () {
                                        secondText.text = convert(valorE,
                                                valorF, snapshot, firstText)
                                            .toStringAsFixed(2);
                                      },
                                      child: Text(
                                        "Converter",
                                        style: GoogleFonts.openSans(
                                            color: Colors.white,
                                            fontSize: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.030,
                                            fontWeight: FontWeight.w500),
                                      )))
                            ],
                          );
                        }
                    }
                  }))),
    );
  }
}

FlagsCode changeFlag(String? value) {
  switch (value) {
    case "BRL":
      return FlagsCode.BR;
    case "USD":
      return FlagsCode.US;
    case "EUR":
      return FlagsCode.EU;
    case "GBP":
      return FlagsCode.GB;
    default:
      return FlagsCode.AC;
  }
}

double convert(String? value1, String? value2, AsyncSnapshot test,
    TextEditingController field1) {
  if (value1 == "BRL") {
    if (value2 == "BRL") {
      return double.parse(field1.text);
    } else {
      double valueA = double.parse(field1.text);
      double valueB = test.data!['results']['currencies']["$value2"]['buy'];
      switch (value2) {
        case "USD":
          return valueA / valueB;
        case "EUR":
          return valueA / valueB;
        case "GBP":
          return valueA / valueB;
      }
    }
  }
  if (value1 == "USD") {
    if (value2 == "USD") {
      return double.parse(field1.text);
    } else if (value2 == "BRL") {
      return (test.data!['results']['currencies']["$value1"]['buy']) *
          double.parse(field1.text);
    } else {
      double valueA = double.parse(field1.text);
      double valueB = test.data!['results']['currencies']["$value2"]['buy'];
      double valueC = test.data!['results']['currencies']["$value1"]['buy'];
      switch (value2) {
        case "EUR":
          return (valueA * valueC / valueB);
        case "GBP":
          return (valueA * valueC / valueB);
      }
    }
  }
  if (value1 == "EUR") {
    if (value2 == "EUR") {
      return double.parse(field1.text);
    } else if (value2 == "BRL") {
      return (test.data!['results']['currencies']["$value1"]['buy']) *
          double.parse(field1.text);
    } else {
      double valueA = double.parse(field1.text);
      double valueB = test.data!['results']['currencies']["$value2"]['buy'];
      double valueC = test.data!['results']['currencies']["$value1"]['buy'];
      switch (value2) {
        case "USD":
          return (valueA * valueC / valueB);
        case "GBP":
          return (valueA * valueC / valueB);
      }
    }
  }
  if (value1 == "GBP") {
    if (value2 == "GBP") {
      return double.parse(field1.text);
    } else if (value2 == "BRL") {
      return (test.data!['results']['currencies']["$value1"]['buy']) *
          double.parse(field1.text);
    } else {
      double valueA = double.parse(field1.text);
      double valueB = test.data!['results']['currencies']["$value2"]['buy'];
      double valueC = test.data!['results']['currencies']["$value1"]['buy'];
      switch (value2) {
        case "USD":
          return (valueA * valueC / valueB);
        case "EUR":
          return (valueA * valueC / valueB);
      }
    }
  }
  return 2;
}
