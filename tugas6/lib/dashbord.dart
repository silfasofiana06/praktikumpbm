import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HalamanDashboard extends StatefulWidget {
  const HalamanDashboard({super.key});

  @override
  State<HalamanDashboard> createState() => _HalamanDashboardState();
}

class _HalamanDashboardState extends State<HalamanDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("DASHBOARD" , style: TextStyle(color: Colors.pink,fontWeight: FontWeight.w700,fontSize: 32)),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 0,
                color: Colors.pink,
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: Center(child: Text('SILFA SOFIANA LESTARI', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)),
                ),
              ),
              Card(
                elevation: 0,
                color: Colors.pink,
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: Center(child: Text('2010631170032', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700))),
                ),
              ),
              Card(
                elevation: 0,
                color: Colors.pink,
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: Center(child: Text('INFORMATIKA 2022' , style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}