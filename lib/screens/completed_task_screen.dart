import 'package:flutter/material.dart';
import '../services/todo_services.dart';

class completed_task_screen extends StatefulWidget {
  final String? title;
  final String? detail;

  const completed_task_screen({super.key, this.title, this.detail});

  @override
  _completed_task_screenState createState() => _completed_task_screenState();
}

class _completed_task_screenState extends State<completed_task_screen> {
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
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),
            const Text(
              'Completed Task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: completedToDo.isEmpty
          ? const Center(
              child: Text(
                'No completed tasks to display.',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            )
          : ListView.builder(
              itemCount: completedToDo.length,
              itemBuilder: (context, index) {
                return _completeContainer(completedToDo[index]);
              },
            ),
    );
  }

  Widget _completeContainer(Map<String, dynamic> completedToDo) {
    return Container(
      margin: const EdgeInsets.all(16.0),
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
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 10), // Add some padding
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Title: ${completedToDo['title']}',
                style: const TextStyle(fontSize: 15),
              ),
              Text(
                'Detail: ${completedToDo['detail']}',
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
