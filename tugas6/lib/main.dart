import 'package:flutter/material.dart';
import 'package:shared_pref/dashbord.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: HalamanLogin(),
    );
  }
}

class HalamanLogin extends StatefulWidget {
  const HalamanLogin({super.key});

  @override
  State<HalamanLogin> createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  final Future<SharedPreferences> _preference = SharedPreferences.getInstance();
  bool booleans = false;

  void _BooleanButton() async {
    final SharedPreferences prefs = await _preference;
    setState(() {
      booleans = !booleans;
      if(booleans == true){
        Navigator.of(context).push(MaterialPageRoute(builder:(context) => HalamanDashboard(),));
      }
    });
    prefs.setBool('booleans', booleans);
  }

  _getBool() async {
    final SharedPreferences prefs = await _preference;
    setState(() {
      booleans = prefs.getBool('booleans') ?? booleans;
      if(booleans == true){
        Navigator.of(context).push(MaterialPageRoute(builder:(context) => HalamanDashboard(),));
      }
    });
  }

  void initState(){
    super.initState();
    _getBool();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child:Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  label: Text("Email atau No Handphone"),
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  label: Text("Kata Sandi"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Belum punya akun? Regist Disini",style: TextStyle(fontWeight: FontWeight.w200),),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                child: ElevatedButton(onPressed: _BooleanButton, child: Text("MASUK"))),
          ]),
        ) ),
    );
  }
}