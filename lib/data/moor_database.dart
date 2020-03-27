
import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Tasks extends Table {  
  // Defining properties (Table columns)

  // by default the id id set as primary key when applying autoIncrement(),
  // but can be overriden using a setter
  IntColumn get id => integer().autoIncrement().call();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get completed => boolean().withDefault(Constant(false))();

}

// The database class
@UseMoor(tables: [Tasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}