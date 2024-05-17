import 'package:flutter/material.dart';
import 'package:todoapp/screens/screen1.dart';

class Entryscreen extends StatelessWidget {
  const Entryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '  TODO ',
              style: TextStyle(
                  color: Colors.indigo[200],
                  fontSize: 60,
                  fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Homescreen(Title: '', Detail: '',),
                  ));
            },
            icon: Icon(
              Icons.arrow_forward_ios_outlined,color: Colors.indigo[200],
            ),
          )
        ],
      ),
    );
  }
}
