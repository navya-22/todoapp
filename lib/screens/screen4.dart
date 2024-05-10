import 'package:flutter/material.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
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
              'Completed Task',
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
          complete(context),
          complete(context),
          complete(context),
        ],
      ),
    );
  }

  Container complete(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width - 15,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                '    TODO TITLE  ',
                style: TextStyle(color: Colors.indigo[200], fontSize: 15),
              ),
              Text(
                '    TODO SUB TITLE ',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ],
      ),
    );
  }
}
