import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:provider/provider.dart';
import 'package:qr_reader/utils/utils.dart';

import '../providers/providers.dart';

class ScanButtom extends StatelessWidget {
  const ScanButtom({super.key});

  @override
  Widget build(BuildContext context) {
    final scansListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', true, ScanMode.QR);

        // const barcodeScanRes = 'https://fernando-herrera.com';

        // const barcodeScanRes = 'geo:36.1216286,-115.2157006';

        if (barcodeScanRes == -1) return;

        // scansListProvider.newScan('geo:15.76,78.98');

        final newScan = await scansListProvider.newScan(barcodeScanRes);
        launchInBrowser(context, newScan);
      },
      child: const Icon(Icons.center_focus_strong, color: Colors.white),
    );
  }
}
