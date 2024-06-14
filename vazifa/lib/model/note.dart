class Note {
  final int id;
  String title;
  String subTitle;

  Note({
    required this.id,
    required this.title,
    required this.subTitle,
  });

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as int,
      title: map['title'].toString(),
      subTitle: map['subTitle'].toString(),
    );
  }
}
