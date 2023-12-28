import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getGreeting(_focusedDay)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          if (screenWidth > 600) {
            return Row(
              children: [
                Expanded(
                  child: TableCalendar(
                    focusedDay: DateTime.now(),
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    selectedDayPredicate: (day) {
                      // Use `selectedDayPredicate` to determine which day is currently selected.
                      // If this returns true, then `day` will be marked as selected.

                      // Using `isSameDay` is recommended to disregard
                      // the time-part of compared DateTime objects.
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        // Call `setState()` when updating the selected day
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                    },
                    calendarFormat: _calendarFormat,
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  ),
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    // itemBuilder: (context, index) {
                    //   final sameDay = todos.values.where(
                    //       (e) => e.dateTime == _selectedDay?.millisecondsSinceEpoch);
                    //   if (sameDay != null) {}
                    // },
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
            );
          } else {
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: TableCalendar(
                    focusedDay: DateTime.now(),
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    selectedDayPredicate: (day) {
                      // Use `selectedDayPredicate` to determine which day is currently selected.
                      // If this returns true, then `day` will be marked as selected.

                      // Using `isSameDay` is recommended to disregard
                      // the time-part of compared DateTime objects.
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        // Call `setState()` when updating the selected day

                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                    },
                    calendarFormat: _calendarFormat,
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  ),
                ),
                Expanded(child: SizedBox(height: 40,)),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: todos.values.length,
                      itemBuilder: (context, index) {
                        Todo todo = todos.values.elementAt(index);
                        return TodoItem(
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
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        }),
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
