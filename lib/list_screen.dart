import 'package:flutter/material.dart';
import 'package:my_todolist/ItemList.dart';
import 'package:my_todolist/category.dart';
import 'package:my_todolist/create_screen.dart';
import 'package:my_todolist/todo.dart';
import 'package:table_calendar/table_calendar.dart';

import 'main.dart';
import 'todo_item.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  DateTime get focusedDay => _focusedDay;

  String getGreeting(DateTime now) {
    int hour = now.hour;
    if (0 <= hour && hour < 6) {
      return 'Good Night!';
    } else if (6 <= hour && hour < 12) {
      return 'Good morning!';
    } else if (12 <= hour && hour < 18) {
      return 'Good Afternoon!';
    } else {
      return 'Good Evening!';
    }
  }

  final _clothesList = Category().clothes;
  final _immigrationList = Category().immigration;
  final _makeupList = Category().makeups;
  final _electronicList = Category().electronics;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(getGreeting(_focusedDay)),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  ItemList(itemList: _clothesList, title: 'Clothes',),
                  ItemList(itemList: _immigrationList, title: 'Immigration',),
                  ItemList(itemList: _makeupList, title: 'makeup supplies',),
                  ItemList(itemList: _electronicList, title: 'electronics',),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView(
                children: todos.values
                    .map(
                      (todo) => TodoItem(
                        todo: todo,
                        onTap: (e) async {
                          e.isDone = !e.isDone;
                          await todo.save();
                          setState(() {});
                        },
                        onDelete: (Todo) async {
                          await todo.delete();
                          setState(() {});
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateScreen()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

