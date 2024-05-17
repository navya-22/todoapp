//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:todoapp/screens/screen1.dart';
//import 'package:todoapp/screens/screen1.dart';
import 'package:todoapp/services/todo_services.dart';

class Addscreen extends StatefulWidget {
  const Addscreen({
    super.key,

  });
  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  final TextEditingController _titleControler = TextEditingController();
  final TextEditingController _detailControler = TextEditingController();

  @override
  void dispose() {

    _titleControler.dispose();
    _detailControler.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[200],
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                )),
            const Text(
              'Add Task',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              maxLength: 10,
              controller: _titleControler,
              decoration:  const InputDecoration(labelText: 'Title'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              maxLength: 10,
              controller: _detailControler,
              decoration: const InputDecoration(labelText: 'Detail'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 80,
            decoration: BoxDecoration(
                color: Colors.indigo[200],
                borderRadius: BorderRadius.circular(10)),
            child:TextButton(
              onPressed: () {
                String title = _titleControler.text;
                String detail = _detailControler.text;
                if (title.isNotEmpty && detail.isNotEmpty) {
                  Navigator.pop(context);
                   addTodo(title: title, detail: detail);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        title: Text('Text needed'),
                        actions: <Widget>[
                        TextButton(
                        onPressed: () {
                  Navigator.of(context).pop();
                  },
                    child: Text('Ok'),),

                    ],
                    ),
                  );
                }
                ;
              },
              child: const Text(
                'ADD',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
