import 'package:flutter/material.dart';

class ResponsiveProductGrid extends StatelessWidget {
  const ResponsiveProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final int columns;
        if (width < 600) {
          columns = 2;
        } else if (width < 900) {
          columns = 3;
        } else {
          columns = 4;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Products (width: ${width.toStringAsFixed(0)}'
              ' → $columns columns)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 12,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context, index) {
                return _ProductItemCard(
                  title: 'Product number $index with a quite long name',
                  price: '\$${(index + 1) * 10}',
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _ProductItemCard extends StatelessWidget {
  final String title;
  final String price;

  const _ProductItemCard({
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final titleFontSize =
        (screenWidth * 0.03).clamp(12.0, 16.0).toDouble();
    final priceFontSize =
        (screenWidth * 0.035).clamp(14.0, 18.0).toDouble();

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.orange.withAlpha(20),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            price,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: priceFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
  }
}