import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutSuggestions extends StatelessWidget {
  WorkoutSuggestions({super.key});

  final standard = "";
  final TextStyle textstyle2 = GoogleFonts.oswald(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                } , 
                child: const Text("Return")),
              Container(
                width: 300,
                height: 50,
                child: TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Legs"),
                              content: Text(
                                  "BB Back Squat - 4 x 6, 75% Max, Front Squat - 4 x 4, 75% Max, Leg Curls - 4 x 10, 85% Max",
                                  style: textstyle2 ),
                            );
                          });
                    },
                    child: Text("Legs")),
              ),
              Container(
                width: 300,
                height: 50,
                child: TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Arms"),
                              content: Text(
                                  "Bicep Curls - 4 x 10, Tricep Extentions - 4 x 10, Preacher Curls 3 x 10, Dips - 3 x 10",
                                  style: textstyle2 ),
                            );
                          });
                    },
                    child: Text("Arms")),
              ),
              Container(
                width: 300,
                height: 50,
                child: TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Chest"),
                              content: Text(
                                  "BB Bench Press - 4 x 6, DB Bench Press - 4 x 6, DB Incline Bench - 4 x 8, Push ups - 3 x 10 ",
                                  style: textstyle2 ),
                            );
                          });
                    },
                    child: Text("Chest")),
              ),
              Container(
                width: 300,
                height: 50,
                child: TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Back"),
                              content: Text(
                                  "BB Row - 4 x 8, DB Row - 4 x 8, Face Pulls - 4 x 10, Pull ups - 3 x 10",
                                  style: textstyle2 ),
                            );
                          });
                    },
                    child: Text("Back")),
              )]))));
  }
}