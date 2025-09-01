import 'package:bookly_app/Features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:flutter/material.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 135,
      child: Row(children: [FeaturedListViewItem(), SizedBox(height: 20)]),
    );
  }
}
