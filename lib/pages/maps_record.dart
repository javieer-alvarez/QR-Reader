import 'package:flutter/material.dart';

import 'package:qr_reader/widgets/widgets.dart';

class MapsRecord extends StatelessWidget {
  const MapsRecord({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return ScanItem(type: type);
  }
}

//TODO: Se podría optimizar más el código mandándole directamente el 
//'type' al ScanItem desde el Home Page

//Todo: se podría hacer incluso borrando los archivos de 'MapRecord' y 'PagesDirections'