import 'database_helper.dart';
import 'diary.dart';
import 'package:flutter/material.dart';

class DbProvider extends ChangeNotifier {
  late DatabaseHelper _dbHelper;

  List<Diary> _diaries = [];

  List<Diary> get diaries => _diaries;

  DbProvider() {
    _dbHelper = DatabaseHelper();
    _getAllDiaries();
  }
  

  void _getAllDiaries() async {
    _diaries = await _dbHelper.getDiaries();
    notifyListeners();
  }

  Future<void> addDiaries(Diary diary) async {
    await _dbHelper.insertDiary(diary);
    _getAllDiaries();
  }
  Future<void> updateDiaries(Diary diary) async {
    await _dbHelper.updateDiary(diary);
    _getAllDiaries();
  }

  Future<void> deleteDiaries(int id) async {
    await _dbHelper.deleteDiary(id);
    _getAllDiaries();
  }
}