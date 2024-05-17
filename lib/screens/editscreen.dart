import 'package:flutter/material.dart';
import 'package:todoapp/services/todo_services.dart';

class Editscreen extends StatefulWidget {
  final String title;
  final String detail;
  final int index;
  const Editscreen({required this.title,
    required this.detail,
    super.key, required this.index});

  @override
  State<Editscreen> createState() => _EditscreenState();
}

class _EditscreenState extends State<Editscreen> {
  late TextEditingController _titleController;
  late TextEditingController _detailController;
  @override
  void initState(){
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _detailController =TextEditingController(text: widget.detail);
  }
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
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                )),
            Text(
              'Edit Task',
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
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _detailController,
              decoration: InputDecoration(labelText: 'Detail'),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                width: 180,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.indigo[200],
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                    onPressed: () {
                      String title = _titleController.text;
                      String detail = _detailController.text;
                   Navigator.pop(context);
                   editedTodo(title: title,detail: detail, index: widget.index);


                    },
                    child: Text('Update')),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                width: 180,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.indigo[200],
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel')),
              )
            ],
          ),
        ],
      ),
    );
  }
}
