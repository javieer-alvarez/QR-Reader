import 'package:flutter/material.dart';

import 'package:qr_reader/widgets/widgets.dart';

class PagesDirections extends StatelessWidget {
  const PagesDirections({Key? key, required this.type}) : super(key: key);
  final String type;

  @override
  Widget build(BuildContext context) {
    return const ScanItem(type: 'http');
  }
}

//TODO: Se podría optimizar más el código mandándole directamente el 'type' al ScanItem desde el Home Page