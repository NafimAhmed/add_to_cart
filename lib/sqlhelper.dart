
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTable(sql.Database database)async{

    await database.execute("""
    CREATE TABLE item(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    productID INTEGER,
    description TEXT,
    title TEXT,
    imgURL TEXT,
    price DOUBLE
    )
    """);

  }


  static Future<sql.Database> db()async{

    return sql.openDatabase("dbtech.db",
      version: 1,
      onCreate: (sql.Database databse,int version) async {
      await createTable(databse);
      }
    );
  }

  static Future<int> createItem(String title,String? description)async{
    final db=await SQLHelper.db();
    final data={'title':title,'description':description};
    final id=await db.insert("items",data,conflictAlgorithm:sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String,dynamic>>> getItems()async{
    final db=await SQLHelper.db();
    
    return db.query('items',orderBy: "id");

  }

}