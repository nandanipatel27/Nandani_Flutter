import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  Future<Database> setDatabase() async {
    // get the current directory

    var directory = await getApplicationDocumentsDirectory(); //current location directory get

    var path = join(directory.path, "mydatabase"); //directory na path sathe database 

    var database = await openDatabase(path, version: 1, onCreate: createTable);

    return database;
  }

  Future<void> createTable(Database database, int version) async {
    String? sql =
        "CREATE TABLE student(id integer primary key autoincrement, name text, subject text)";

    database.execute(sql);
  }
}
