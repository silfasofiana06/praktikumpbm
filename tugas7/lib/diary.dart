class Diary {
  late int? id;
  late String judul;
  late String isi;

  Diary({
    this.id,
    required this.judul,
    required this.isi,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'judul': judul,
      'isi': isi,
    };
  }

  Diary.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    judul = map['judul'];
    isi = map['isi'];
  }
}
