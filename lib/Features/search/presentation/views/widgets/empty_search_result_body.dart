import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class EmptySearchResultBody extends StatelessWidget {
  const EmptySearchResultBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 50),
          SizedBox(height: 8),
          Text('What Kind Of Book Do You Want?', style: Styles.textStyle20),
        ],
      ),
    );
  }
}
