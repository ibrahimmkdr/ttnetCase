import 'package:flutter/material.dart';

import '../../core/constant/app_text.dart';

class NoConnectionRow extends StatelessWidget {
  const NoConnectionRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appText = AppText();
    return SliverToBoxAdapter(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          appText.noConnection,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
