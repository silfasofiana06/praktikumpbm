import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'database_provider.dart';
import 'add_diary_page.dart';
import 'update_diary_page.dart';

class ListDiary extends StatelessWidget {
  const ListDiary({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Consumer<DbProvider>(
        builder: (context, provider, child) {
          final diaries = provider.diaries;
          return ListView.builder(
            itemCount: diaries.length,
            itemBuilder: (context, index) {
              final diary = diaries[index];
              return Dismissible(
                key: Key(diary.id!.toString()),
                background: Container(color: Colors.red),
                onDismissed: (direction) {},
                child: Card(
                  child: ListTile(
                    title: Text(diary.judul,maxLines: 1, overflow: TextOverflow.ellipsis),
                    
                    subtitle: Text(diary.isi),
                    trailing: IconButton(onPressed: () async {
                      Provider.of<DbProvider>(context, listen: false).deleteDiaries(diary.id!);
                    }, icon: Icon(Icons.delete)),
                    onTap: () async {
                      Navigator.push(context, MaterialPageRoute(builder:(context) {
                        return UpdateDiaryPage(diary: diary);
                      },));
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () { 
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddDiaryPage()));
        },
      ),
    );
  }
}

