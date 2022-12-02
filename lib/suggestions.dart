import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutSuggestions extends StatelessWidget {
  WorkoutSuggestions({super.key});

  final standard = "";
  final TextStyle textstyle1 = GoogleFonts.oswald(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
  );
  final TextStyle textstyle2 = GoogleFonts.lato(
    fontSize: 12,
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
  );
  final TextStyle textstyle3 = GoogleFonts.oswald(
    fontSize: 25,
    fontWeight: FontWeight.w700,
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
                Container(
                width: 300,
                height: 50,),
              Container(
                width: 300,
                height: 100,
                color: Color.fromARGB(255, 255, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Legs", 
                                  style: textstyle1,),
                              content: Text(
                                  "BB Back Squat - 4 x 6, 75% Max, Front Squat - 4 x 4, 75% Max, Leg Curls - 4 x 10, 85% Max",
                                  style: textstyle2 ),
                            );
                          });
                    },
                    child: Text("Legs",
                    style: textstyle3,)),
              ),
              Container(
                width: 300,
                height: 50,),
              Container(
                width: 300,
                height: 100,
                color: Color.fromARGB(255, 255, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Arms",
                                  style: textstyle1,),
                              content: Text(
                                  "Bicep Curls - 4 x 10, Tricep Extentions - 4 x 10, Preacher Curls 3 x 10, Dips - 3 x 10",
                                  style: textstyle2 ),
                            );
                          });
                    },
                    child: Text("Arms",
                    style: textstyle3,)),
              ),
              Container(
                width: 300,
                height: 50,),
              Container(
                width: 300,
                height: 100,
                color: Color.fromARGB(255, 255, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Chest",
                                  style: textstyle1,),
                              content: Text(
                                  "BB Bench Press - 4 x 6, DB Bench Press - 4 x 6, DB Incline Bench - 4 x 8, Push ups - 3 x 10 ",
                                  style: textstyle2 ),
                            );
                          });
                    },
                    child: Text("Chest",
                    style: textstyle3,)),
              ),
              Container(
                width: 300,
                height: 50,),
              Container(
                width: 300,
                height: 100,
                color: Color.fromARGB(255, 255, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Back",
                                  style: textstyle1,),
                              content: Text(
                                  "BB Row - 4 x 8, DB Row - 4 x 8, Face Pulls - 4 x 10, Pull ups - 3 x 10",
                                  style: textstyle2 ),
                            );
                          });
                    },
                    child: Text("Back",
                    style: textstyle3,)),     
              ),
              Container(
                width: 300,
                height: 50,),
              Container(
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  } , 
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 0, 0), ),
                  child: Text("Return",
                  style: textstyle3,)),
              ),
              ]))));
  }
}