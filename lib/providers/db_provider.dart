import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:qr_reader/models/models.dart';
export 'package:qr_reader/models/models.dart';

class DBProvider {
  static Database? _dataBase;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get dataBase async {
    if (_dataBase != null) return _dataBase;

    _dataBase = await initDB();

    return _dataBase;
  }

  Future<Database?> initDB() async {
    // Path de donde alacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    //Creación de base de datos:

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
          )
    ''');
      },
    );
  }

  Future<int> newScanRaw(ScanModel newScan) async {
    final id = newScan.id;
    final tipo = newScan.tipo;
    final valor = newScan.valor;

    //Verificar la base de datos
    final db = await dataBase;
    final res = await db!.rawInsert('''
    INSERT INTO Scans (id, tipo, valor)
    VALUES ($id, '$tipo', '$valor')
''');
    return res;
  }

  Future<int> newScan(ScanModel newScan) async {
    final db = await dataBase;
    final res = await db!.insert('Scans', newScan.toJson());
    //Es el id del útimo registro insertado
    print(res);
    return res;
  }

  Future<ScanModel?> getScanById(int i) async {
    final db = await dataBase;
    final res = await db!.query('Scans', where: 'id = ?', whereArgs: [i]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>?> getAllScans() async {
    final db = await dataBase;
    final res = await db!.query('Scans');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<List<ScanModel>?> getScansbyType(String tipo) async {
    final db = await dataBase;
    final res = await db!.rawQuery('''
SELECT * FROM Scans WHERE tipo = '$tipo'
''');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<int> updateScans(ScanModel newScan) async {
    final db = await dataBase;
    final res = await db!.update('Scans', newScan.toJson(),
        where: 'id = ?', whereArgs: [newScan.id]);

    return res;
  }

  Future<int> deleteScans(int id) async {
    final db = await dataBase;
    final res = await db!.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await dataBase;
    final res = await db!.rawDelete('''
      DELETE FROM Scans
      ''');
    return res;
  }
}
