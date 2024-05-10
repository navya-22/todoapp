import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/screen2.dart';
import 'package:todoapp/screens/screen3.dart';
import 'package:todoapp/screens/screen4.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        backgroundColor: Colors.indigo[200],
        title: Row(
          children: [
            Text(
              'TODO APP',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            ),
            SizedBox(
              width: 200,
            ),
            Icon(
              Icons.calendar_month_outlined,
              color: Colors.white,
              size: 30,
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 20,),
              todoContainer(context),
              todoContainer(context),
              todoContainer(context),
              todoContainer(context),
              todoContainer(context),

              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.indigo[200],
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Screen2(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.format_list_bulleted_sharp,
                color: Colors.indigo[200],
              ),
              label: 'All'),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.check,
                  color: Colors.indigo[200],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Screen4(),
                      ));
                },
              ),
              label: 'Completed'),
        ],
      ),
    );
  }

  Container todoContainer(BuildContext context) {
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
                height: 10,
              ),
              Text(
                '    TODO TITLE  ',
                style: TextStyle(color: Colors.indigo[200], fontSize: 22),
              ),
              Text(
                '    TODO SUB TITLE ',
              )
            ],
          ),
          SizedBox(
            width: 100,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen3(),
                    ));
              },
              icon: Icon(
                Icons.edit_outlined,
                color: Colors.indigo[200],
              )),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.delete_outline,
            color: Colors.indigo[200],
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.check_circle_outline,
            color: Colors.indigo[200],
          )
        ],
      ),
    );
  }
}
