import 'package:hive/hive.dart';
part 'Counter.g.dart';
@HiveType(typeId: 0)
class Counter{
  @HiveField(0)
   late int id;
   @HiveField(1)
   late int count;
   Counter(this.id,this.count);
}