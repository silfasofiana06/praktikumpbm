import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Silfa App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Silfa App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double font_size = 12.0;
  bool booleans = true;
  String name = "Silfa Sofiana Lestari";

  void tambahsize(){
    setState(() {
      font_size++;
    });
  }

  void gantinama(){
    setState(() {
      booleans = !booleans;
    if(!booleans){
      name = "Silfa Cantik";
    }else{
      name = "Silfa Sofiana Lestari";
    }
    });
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color.fromRGBO(126, 0, 243, 1),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Font Size $font_size",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: font_size,color: Colors.white),),
                SizedBox(
                  height: 20,
                ),
                Text("Nama : $name",
                style: TextStyle(color: Colors.white),),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(onPressed: tambahsize,icon : Icon(Icons.add,color: Colors.white,), label: Text("Font Size",style: TextStyle(color: Colors.white),)),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton.icon(onPressed: gantinama,icon : Icon(Icons.change_circle,color: Colors.white,), label: Text("Ganti Nama",style: TextStyle(color: Colors.white),)),
                  ],
                )
            ]),
          ),
        )),
    );
  }
}