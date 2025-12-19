import 'package:flutter/material.dart';

class DismissibleContainer extends StatelessWidget {
  const DismissibleContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Icon(
          Icons.delete_outline,
          color: Colors.white,
        ),
        SizedBox(
          width: 20,
        )
      ]),
    );
  }
}
