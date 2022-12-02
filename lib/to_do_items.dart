import 'package:flutter/material.dart';
import 'package:to_dont_list/suggestions.dart';
import 'package:google_fonts/google_fonts.dart';

typedef ToDoListChangedCallback = Function(Workout workout, bool completed);
typedef ToDoListRemovedCallback = Function(Workout workout);

class ToDoListItem extends StatelessWidget {
  ToDoListItem(
      {required this.workout,
      required this.completed,
      required this.onListChanged,
      required this.onDeleteItem,
      required this.displayEditDialog})
      : super(key: ObjectKey(workout));

  final Workout workout;
  final bool completed;
  final ToDoListChangedCallback onListChanged;
  final ToDoListRemovedCallback onDeleteItem;
  final ToDoListRemovedCallback displayEditDialog;

  final TextStyle textstyle1 = GoogleFonts.lato(
    fontSize: 14,
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5));

  /* new dialog for edit button. What it needs to do:
    - Take in workout with its info
    - Autofill workout info in each text box
    - Save the changes after it's done
  */

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different
    // parts of the tree can have different themes.
    // The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return completed //
        ? Colors.black54
        : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!completed) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.none,
    );
  }

  Future<void> _displayWorkoutInfo(BuildContext context) async {
    print("Showing information");
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Exercise Info'),
            content:
            SizedBox(
              height: 60,
              width: 100,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text("Exercise: ${workout.name}"),
              Text("Sets: ${workout.sets}"),
              Text("Reps: ${workout.reps}"),
            ])),
            actions: <Widget>[
              ElevatedButton(
                key: const Key("Leave"),
                child: const Text('Leave'),
                onPressed: () {
                  Navigator.pop(context);
                
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 0, 0)
              ),
          )],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return
    Card(
      shadowColor: Colors.black,
       child: ListTile(
          onTap: () {
            onListChanged(workout, completed);
          },
          onLongPress: () {
            _displayWorkoutInfo(context);
          },
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Text(workout.abbrev(),
            style: textstyle1,),
          ),
          title: Text(
            workout.name,
            style: _getTextStyle(context),
          ),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            ElevatedButton(
                onPressed: () {
                  displayEditDialog(workout);
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 0, 0), ),
                key: const Key("Edit Button"),
                child: Text("Edit",
                style: textstyle1,)),
            Container(
              width: 10,
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutSuggestions()));
                } , 
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 0, 0), ),
                child: Text("Suggestions",
                style: textstyle1,)),
            TextButton(
                onPressed: () {
                  onDeleteItem(workout);
                },
                child: Text("X",
                    key: Key("Delete Button"),
                    style: textstyle1)),
          ])),
     );
  }
}

class Workout {
  Workout({required this.name, required this.reps, required this.sets});
  String name;
  String sets;
  String reps;

  String abbrev() {
    return name.substring(0, 1);
  }
}
