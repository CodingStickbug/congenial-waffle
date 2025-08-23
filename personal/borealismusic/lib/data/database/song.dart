import 'package:hive/hive.dart';

part 'song.g.dart';

@HiveType(typeId: 1)
class Song {
  Song({required this.name, required this.pathName});
  @HiveField(0)
  String name;

  @HiveField(1)
  String pathName;
}
