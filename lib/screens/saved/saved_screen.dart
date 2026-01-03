import 'package:flutter/material.dart';
import 'package:proxy_fast_telegram/constants/text_styles.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Saved Screen', style: AppTextStyles.appBarTitle),
      ),
    );
  }
}
