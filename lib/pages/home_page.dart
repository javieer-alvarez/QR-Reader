import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qr_reader/pages/pages.dart';
import 'package:qr_reader/widgets/widgets.dart';

import '../providers/providers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .deleteAll();
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.white,
              ))
        ],
        elevation: 0,
        title: const Text('History', style: TextStyle(color: Colors.white)),
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    //Obtener el menú seleccionado
    final uiProvider = Provider.of<UiProvider>(context);

    //Cambiar para mostrar la página respectiva
    final int currentIndex = uiProvider.selectedMenuOpt;

    //Usar el ScanListProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return const MapsRecord(
          type: 'geo',
        );
      case 1:
        scanListProvider.loadScansByType('http');
        return const PagesDirections(
          type: 'http',
        );

      default:
        return const MapsRecord(
          type: 'geo',
        );
    }
  }
}
