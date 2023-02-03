import 'package:chart_test/domain/entities/company_entity.dart';
import 'package:flutter/material.dart';

class CompanyDetailScreen extends StatelessWidget {
  final CompanyEntity company;

  const CompanyDetailScreen(this.company, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'О компании'
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.ltr,
          children: [
            Text('Название компании: ${company.name}'),
            Text('Сектор: ${company.sector}'),
            Text('Капитализация: ${company.marketCapitalization}'),
          ],
        ),
      ),
    );
  }
}
