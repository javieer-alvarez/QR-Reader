import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import 'package:qr_reader/themes/primary_theme.dart';
import 'package:qr_reader/widgets/widgets.dart';

import '../utils/utils.dart';

class ScanItem extends StatelessWidget {
  const ScanItem({
    super.key,
    required this.type,
  });

  final String type;
  @override
  Widget build(BuildContext context) {
    final scansListProvider = Provider.of<ScanListProvider>(context);
    final scans = scansListProvider.scans;
    if (scans.isEmpty) return const EmptyBackground();
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: scans.length,
          itemBuilder: (_, i) => Dismissible(
              onDismissed: (DismissDirection direction) {
                scansListProvider.deleteScanById(scans[i].id!);
              },
              key: UniqueKey(),
              background: const DismissibleContainer(),
              child: ListTile(
                  leading: Icon(
                    type == 'http' ? Icons.home_outlined : Icons.map_outlined,
                    color: PrimaryTheme.primary,
                  ),
                  title: Text(scans[i].valor),
                  subtitle: Text('ID: ${scans[i].id}'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () => launchInBrowser(context, scans[i]))),
        ),
      ),
    );
  }
}
