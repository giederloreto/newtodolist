import 'package:flutter/material.dart';
import 'package:newtodolist/models/item_model.dart';

class HomeScreen extends StatefulWidget {
  List<Item> items = [];

  HomeScreen() {
    items = [];
    items.add(
      Item(title: "Farinha Lactea Nestle", done: true),
    );
    items.add(
      Item(title: "Leite", done: false),
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var addTaskHint = const Text(
    "Adicionar Tarefa",
    style: TextStyle(color: Colors.white),
  );
  TextEditingController controllerTextFormFieldAddTask =
      TextEditingController();

  void addTaskOnList() {
    if (controllerTextFormFieldAddTask != null) {
      setState(() {
        widget.items.add(
          Item(title: controllerTextFormFieldAddTask.text, done: false),
        );
      });
    }
    controllerTextFormFieldAddTask.clear();
  }

  void removeTask(int index) {
    setState(() {
      widget.items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: controllerTextFormFieldAddTask,
          decoration: InputDecoration(
            label: addTaskHint,
          ),
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              addTaskOnList();
            },
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(widget.items[index].title),
              onDismissed: (direction) {
                removeTask(index);
              },
              child: CheckboxListTile(
                title: Text(widget.items[index].title),
                value: widget.items[index].done,
                onChanged: (value) {
                  setState(() {
                    widget.items[index].done = value!;
                  });
                },
              ),
            );
          }),
    );
  }
}
