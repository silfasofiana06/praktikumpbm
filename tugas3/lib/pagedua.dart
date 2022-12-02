import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class PageDua extends StatelessWidget {
  PageDua({super.key});
  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Masuk'),
        backgroundColor: Color.fromARGB(255, 69, 147, 114),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
      
                SizedBox(
                  height: height*.08,
                ),
      
                Container(
                  child: Center(
                    child: Container(
                      width: width*.8,
                      child: Text("Masukkan nomor telepon/handphone mu untuk melanjutkan proses pendaftaran",textAlign: TextAlign.center,style: GoogleFonts.roboto(fontWeight: FontWeight.bold),)),
                  ),
                ),
      
                SizedBox(
                  height: height*.08,
                ),
      
      
                Container(
                  width: width*.9,
                  height: height*.06,
                  child: TextField(
                    decoration: InputDecoration(
                    suffixIcon: Icon(Icons.close,color: Colors.grey,),
                    labelStyle: TextStyle(),
                    fillColor: Colors.white,
                    label: Text('No.Handphone'),
                    hintText: "+62XX-XXXX-XXXX",
                    border: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
                     borderSide: BorderSide(
                      width: 0,style: BorderStyle.solid)), ),
                  ),
                ),
      
                SizedBox(
                  height: height*.42,
                ),
      
                Container(
                  width: width*.5,
                  child: ElevatedButton(onPressed: (){}, child: Text("Registrasi"),style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 69, 147, 114),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                  ),),
                ),
              ],
            ) ,)),
      ),
      );
  }
}
