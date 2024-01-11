import 'package:flutter/material.dart';
import 'package:my_todolist/main.dart';
import 'package:my_todolist/data/note_model.dart';

import '../../data/note_repository_impl.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
    required List<String> itemList,
    required String title,
  }) : _itemList = itemList, _title = title;

  final List<String> _itemList;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_title),
            const SizedBox(height: 16,),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _itemList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        // save in DB
                        await NoteRepositoryImpl().todos.add(Note(
                          title: _itemList[index],
                          description: '',
                        ));
                      },
                      child: Text(_itemList[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
