
import 'package:flutter/material.dart';
import 'package:todoapp/screens/completed_task_screen.dart';
import 'package:todoapp/screens/editscreen.dart';
import 'package:todoapp/services/todo_services.dart';

import 'addscreen.dart';

class Homescreen extends StatefulWidget {
  final String Title;
  final String Detail;
  const Homescreen({
    super.key, required this.Title, required this.Detail,
  });

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.indigo[50],
        appBar: AppBar(
          backgroundColor: Colors.indigo[200],
          title: Container(
            width: MediaQuery.of(context).size.width,
            child: const Row(
              children: [
                Text(
                  '  TODO APP',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  width: 150,
                ),
                Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: toDo.length,
                    itemBuilder: (BuildContext context, int index) {
                      return todoContainer(
                        context,
                        toDo[index]['title'],
                        toDo[index]['detail'],
                        index,
                      );
                    },
                  ),
                ),
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
                              builder: (context) => const Addscreen(
                              ),
                            ),
                          );
                        },

                        icon: const Icon(
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
              label: 'All',
            ),
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
                      builder: (context) => completed_task_screen(),
                    ),
                  );
                },
              ),
              label: 'Completed',
            ),
          ],
        ),
      ),
    );
  }

  // Define todoContainer as a method of Screen1 widget
  Widget todoContainer(
      BuildContext context,  String title, String detail, int index) => Container(
      margin: const EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width - 15,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),

              Text(
                '  Title : $title ',
                style: TextStyle(color: Colors.indigo[200], fontSize: 22),
              ),
              Text(
                'detail: $detail',
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Editscreen(
                    detail:detail,
                    title: title,
                    index: index,
                  ),
                ),
              );},
            icon: Icon(
              Icons.edit_outlined,
              color: Colors.indigo[200],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              setState(() => deleteTodo(index: index));

            },
            icon: Icon(
              Icons.delete_outline,
              color: Colors.indigo[200],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                completeTodo(
                  index: index,
                );
              });
            },
            icon: Icon(
              Icons.check_circle_outline,
              color: Colors.indigo[200],
            ),
          ),
        ],
      ),
    );
}
