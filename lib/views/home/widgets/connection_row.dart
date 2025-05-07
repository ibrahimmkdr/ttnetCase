import 'package:flutter/material.dart';

import '../../../core/constant/app_text.dart';

class ConnectionRow extends StatelessWidget {
  const ConnectionRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appText = AppText();
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              appText.connectText,
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 4),
            Text(
              "02 : 05: 15",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
