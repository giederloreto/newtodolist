import 'package:flutter/material.dart';
import 'package:newtodolist/models/item_model.dart';

class HomeScreen extends StatefulWidget {
  List<Item> items = [];

  HomeScreen() {
    items = [];
    items.add(
      Item(title: "Farinha Lactea Nestle", done: true),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          decoration: InputDecoration(
            label: addTaskHint,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              title: Text(widget.items[index].title),
              value: widget.items[index].done,
              onChanged: (value) {},
            );
          }),
    );
  }
}
