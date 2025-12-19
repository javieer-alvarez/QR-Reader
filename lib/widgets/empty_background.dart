import 'package:flutter/material.dart';

class EmptyBackground extends StatelessWidget {
  const EmptyBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Icon(
              Icons.qr_code,
              size: 220,
              color: Colors.grey.shade500,
            ),
          ),
          const Text(
            'Scan some QR Code',
            style: TextStyle(color: Colors.black, fontSize: 18),
          )
        ],
      ),
    );
  }
}
