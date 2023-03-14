import 'package:flutter/material.dart';

import '../../../core/util/app_color.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: ListView(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(Icons.menu),
                const Spacer(),
                const Icon(Icons.search),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
