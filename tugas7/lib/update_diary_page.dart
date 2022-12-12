import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'database_provider.dart';
import 'diary.dart';

class UpdateDiaryPage extends StatefulWidget {
  final Diary? diary;
  const UpdateDiaryPage({Key? key, this.diary}) : super(key: key);
  

  @override
  State<UpdateDiaryPage> createState() => _UpdateDiaryPageState();
}

class _UpdateDiaryPageState extends State<UpdateDiaryPage> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _isiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _judulController.text = widget.diary!.judul;
    _isiController.text = widget.diary!.isi;

    return Scaffold(
      appBar: null,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextField(
              style: TextStyle(fontSize: 24),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: _judulController,
              decoration: const InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Judul",
              ),
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: _isiController,
              decoration: const InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Ketik Keluh Kesahmu disini...',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Update'),
        icon: Icon(Icons.update),
        onPressed: () async {
          final diary = Diary(
            id: widget.diary!.id!,
            judul: _judulController.text,
            isi: _isiController.text,
          );
          Provider.of<DbProvider>(context, listen: false).updateDiaries(diary);
          Navigator.pop(context);
          },
        ),
    );
  }
}