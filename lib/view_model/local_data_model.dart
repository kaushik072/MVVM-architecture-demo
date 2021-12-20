import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_project/models/my_app_user.dart';

class LocalDataStorage extends ChangeNotifier {
  String dataBaseName = "local.db";
  MyAppUser? myAppUser;

  LocalDataStorage() {
    retrieveUser();
  }

  /*
  * create local database or initialize database
  * */
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, dataBaseName),
      onCreate: (database, version) async {
        await database.execute(
          """CREATE TABLE user(uid TEXT PRIMARY KEY,mobileNumber TEXT, userName TEXT)""",
        );
      },
      version: 1,
    );
  }

  /*
  * delete local database
  * */
  Future<int> deleteDataBase() async {
    print("delete database");
    int result = 0;
    final Database db = await initializeDB();
    myAppUser = null;
    result = await db.delete("user");
    notifyListeners();
    return result;
  }

  /*
  * store user info in local database
  * */
  Future<int> insertUser(MyAppUser user) async {
    int result = 0;
    final Database db = await initializeDB();
    myAppUser = user;
    result = await db.insert('user', user.toJson());
    notifyListeners();
    return result;
  }

  /*
  * get user detail from local database
  * */
  Future<MyAppUser?> retrieveUser() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('user');
    if (queryResult.length > 0) {
      myAppUser = MyAppUser.fromJson(queryResult.first);
      notifyListeners();
      return myAppUser;
    }
  }

  /*
  * delete user from local database
  * */
  Future<void> deleteUser(MyAppUser? user) async {
    final db = await initializeDB();
    await db.delete(
      'user',
      where: "uid = ?",
      whereArgs: [user!.uid],
    );
    myAppUser = null;
    notifyListeners();
  }
}
