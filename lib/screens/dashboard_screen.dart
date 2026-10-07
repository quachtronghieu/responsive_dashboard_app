import 'package:flutter/material.dart';

import '../widgets/responsive_grid.dart';
import '../widgets/summary_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth * 0.04;
    final headerFontSize =
        (screenWidth * 0.06).clamp(20.0, 32.0).toDouble();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Dashboard'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Dashboard',
                      style: TextStyle(
                        fontSize: headerFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.dashboard, color: Colors.blue),
                ],
              ),
              const SizedBox(height: 16),
              const _SummarySection(),
              const SizedBox(height: 24),
              const ResponsiveProductGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SummarySection extends StatelessWidget {
  const _SummarySection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const cards = [
          SummaryCard(
            title: 'Revenue',
            value: '\$12,300',
            color: Colors.blue,
          ),
          SummaryCard(
            title: 'Orders',
            value: '320',
            color: Colors.green,
          ),
          SummaryCard(
            title: 'Customers',
            value: '89',
            color: Colors.purple,
          ),
        ];

        if (constraints.maxWidth < 600) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              cards[0],
              const SizedBox(height: 12),
              cards[1],
              const SizedBox(height: 12),
              cards[2],
            ],
          );
        }

        return Row(
          children: [
            Expanded(child: cards[0]),
            const SizedBox(width: 12),
            Expanded(child: cards[1]),
            const SizedBox(width: 12),
            Expanded(child: cards[2]),
          ],
        );
      },
    );
  }
}