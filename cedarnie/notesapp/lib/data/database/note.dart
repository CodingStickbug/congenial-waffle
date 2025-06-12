import 'package:hive/hive.dart';

// Structure of the Notes Database

part 'note.g.dart';

@HiveType(typeId: 1)
class Note {
  Note({required this.title, required this.description});
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  // Copywith function to help with editing notes in EditNotePage()
  Note copyWith({
    String? title,
    String? description,
  }) {
    return Note(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
