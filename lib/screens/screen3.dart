import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
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
              // maxLength: 10, // Set the maximum length of the text field
              decoration: InputDecoration(labelText: 'Title'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
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
                      Navigator.pop(context);
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
