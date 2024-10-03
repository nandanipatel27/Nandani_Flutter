// ignore_for_file: unused_import

import 'package:firstapp/Offline%20Database/DatabaseConnection.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  // object creation of database connection

  late DatabaseConnection _databaseConnection;

  //Constructor

  Repository() {
    _databaseConnection = DatabaseConnection(); //initialization
  }

  static Database? _database;

  Future<Database?> get myDatabase async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }

  insertData(tablename, data) async {
    var con = await myDatabase;
    return await con!.insert(tablename, data);
  }

  //fetch all data

  readData(tablename) async {
    var con = await myDatabase;
    return await con!.query(tablename);
  }

  //fetch data condition wise

  readSingledata(tablename, id) async {
    var con = await myDatabase;

    return await con!.query(tablename, where: "id = ?", whereArgs: [id]);
  }

  // update Records :

  updateData(tablename, data) async {
    var con = await myDatabase;

    return await con!
        .update(tablename, data, where: "id = ?", whereArgs: [data['id']]);
  }

  // delete Records :

  deleteData(tablename, data) async {
    var con = await myDatabase;

    return await con!
        .delete(tablename, where: "id = ?", whereArgs: [data['id']]);
  }
}
