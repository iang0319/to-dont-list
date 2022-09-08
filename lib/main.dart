// Started with https://docs.flutter.dev/development/ui/widgets-intro
import 'package:flutter/material.dart';
import 'package:to_dont_list/to_do_items.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  // Dialog with text from https://www.appsdeveloperblog.com/alert-dialog-with-a-text-field-in-flutter/
  final TextEditingController _MakeModelController = TextEditingController();
  final TextEditingController _PackageController = TextEditingController();
  final TextEditingController _PriceEstimateController =
      TextEditingController();
  final ButtonStyle yesStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), primary: Colors.green);
  final ButtonStyle noStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), primary: Colors.red);

  Future<void> _displayTextInputDialog(BuildContext context) async {
    print("Loading Dialog");
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add detail'),
            content: Column(children: <Widget>[
              TextField(
                onChanged: (value) {
                  setState(() {
                    MakeModelText = value;
                  });
                },
                controller: _MakeModelController,
                decoration:
                    const InputDecoration(hintText: "Vehicle Make/Model"),
              ),
              TextField(
                  onChanged: (value) {
                    setState(() {
                      PackageText = value;
                    });
                  },
                  controller: _PackageController,
                  decoration: const InputDecoration(
                      hintText: "Select Package 1, 2, or 3")),
              TextField(
                  onChanged: (value) {
                    setState(() {
                      PriceEstimateText = value;
                    });
                  },
                  controller: _PriceEstimateController,
                  decoration: const InputDecoration(
                      hintText: "Enter your price range")),
            ]),
            actions: <Widget>[
              ElevatedButton(
                key: const Key("OKButton"),
                style: yesStyle,
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    _handleNewItem(MakeModelText, MakeModelText, PackageText,
                        PriceEstimateText);
                    Navigator.pop(context);
                  });
                },
              ),

              // https://stackoverflow.com/questions/52468987/how-to-turn-disabled-button-into-enabled-button-depending-on-conditions
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _MakeModelController,
                builder: (context, value, child) {
                  return ElevatedButton(
                    key: const Key("CancelButton"),
                    style: noStyle,
                    onPressed: value.text.isNotEmpty
                        ? () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          }
                        : null,
                    child: const Text('Cancel'),
                  );
                },
              ),
            ],
          );
        });
  }

  String valueText = "";

  String MakeModelText = "";

  String PackageText = "";

  String PriceEstimateText = "";

  final List<Item> items = [const Item(name: "Example: ")];

  final List<car> cars1 = [
    const car(makemodel: "Nissan", package: "1", priceestimate: "100")
  ];
//Need to find a way to display all text across banner rather than just 1st text

  final _itemSet = <Item>{};

  final _carSet = <car>{};

  final car cars = car(makemodel: "", package: "", priceestimate: "");
  //Example

  void _handleListChanged(Item item, bool completed, car car) {
    setState(() {
      // When a user changes what's in the list, you need
      // to change _itemSet inside a setState call to
      // trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.

      items.remove(item);
      if (!completed) {
        print("Completing");
        _itemSet.add(item);
        items.add(item);
      } else {
        print("Making Undone");
        _itemSet.remove(item);
        items.insert(0, item);
      }

      cars1.remove(car);
      if (!completed) {
        _carSet.add(car);
        cars1.add(car);
      } else {
        _carSet.remove(car);
        cars1.insert(0, car);
        //Need to find a way to delete examples
      }
    });
  }

  void _handleDeleteItem(Item item) {
    setState(() {
      print("Deleting item");
      items.remove(item);
    });
  }

  void _handleNewItem(
      String itemText, String MakeModel, String Package, String PriceEstimate) {
    setState(() {
      print("Adding new item");
      Item item = Item(name: itemText);
      items.insert(0, item);
      car cars = car(
          makemodel: MakeModel, package: Package, priceestimate: PriceEstimate);
      cars1.insert(0, cars);
      _MakeModelController.clear();
      _PackageController.clear();
      _PriceEstimateController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('To Do List'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: items.map((item) {
            return ToDoListItem(
              item: item,
              cars: cars,
              completed: _itemSet.contains(item),
              onListChanged: _handleListChanged,
              onDeleteItem: _handleDeleteItem,
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              _displayTextInputDialog(context);
            }));
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'To Do List',
    home: ToDoList(),
  ));
}
