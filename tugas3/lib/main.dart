import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pagedua.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cup Of Coffe",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatelessWidget {
  HalamanUtama({super.key});

  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Center(
          child: Container(
            color: Color.fromARGB(255, 69, 147, 114),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: height*.1,),
              Text(
                'COFFE PUMP',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    textStyle: TextStyle(color: Color.fromARGB(251, 252, 225, 164),fontWeight: FontWeight.bold
                    ),
                    letterSpacing: 5.0),
              ),
              SizedBox(height: height*.1,),
              SvgPicture.asset("img/logo.svg", width: width*.4,height: height*.3,),
              SizedBox(height: height*.15,),
              Center(
                child: Column(
                  children: [
                    Container(
                      width: width*.9,
                      height: height*.08,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => PageDua()));
                        },
                        child: Text(
                          'Pesan',
                          style: GoogleFonts.roboto(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFEE4C47C),
                            minimumSize: Size(400, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0))),
                      ),
                    ),
                    SizedBox(
                      height: height*.02,
                    ),
                    Text(
                      'Settings',
                      style: GoogleFonts.roboto(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
