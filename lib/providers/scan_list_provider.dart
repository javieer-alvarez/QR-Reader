import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedType = 'http';

  Future<ScanModel> newScan(String value) async {
    final newScan = ScanModel(valor: value);
    final id = await DBProvider.db.newScan(newScan);
    //Asignar ID de nuevo Scan
    newScan.id = id;

    if (selectedType == newScan.tipo) {
      scans.add(newScan);
      notifyListeners();
    }
    return newScan;
  }

  loadScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans!];
    notifyListeners();
  }

  loadScansByType(String type) async {
    final scansByType = await DBProvider.db.getScansbyType(type);
    scans = [...scansByType!];
    selectedType = type;
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBProvider.db.deleteScans(id);
  }
}
