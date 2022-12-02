import 'package:flutter/material.dart';

class WorkoutSuggestions extends StatelessWidget {
  const WorkoutSuggestions({super.key});

  final standard = "";
  final TextStyle textstyle2 = const TextStyle(fontSize: 15, fontStyle: FontStyle.italic);

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
                child: const Text("Suggestions")),
              TextButton(
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
                  child: const Text("Legs"))]))));
  }
}