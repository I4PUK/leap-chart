import 'package:chart_test/domain/entities/company_entity.dart';
import 'package:chart_test/presentation/bloc/dashboard/cubit.dart';
import 'package:chart_test/presentation/bloc/dashboard/state.dart';
import 'package:chart_test/presentation/screens/company_detail_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Дашборд'),
      ),
      body: BlocConsumer<DashboardCubit, DashboardState>(
        listener: (context, state) {},
        builder: (context, state) {
          DashboardCubit cubit = context.read<DashboardCubit>();
          if (state is CompaniesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CompaniesError) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, bottom: 4.0, top: 32.0),
              child: SingleChildScrollView(
                  child: Text(state.message, textAlign: TextAlign.center)),
            );
          }
          if (state is CompaniesLoaded && state.totalCapitalization == 0.0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Отсутствуют данные. Возможно стоит попробовать еще раз', textAlign: TextAlign.center,
                  ),
                  ElevatedButton(onPressed: () => cubit.loadCompanies(), child: const Text(
                    'Попробовать еще раз', textAlign: TextAlign.center,
                  ),)
                ],
              ),
            );
          }
          if (state is CompaniesLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Общая капитализация: ${state.totalCapitalization}"),
                  AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          longPressDuration: const Duration(microseconds: 1),
                          touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
                            if (pieTouchResponse != null &&
                                pieTouchResponse.touchedSection != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CompanyDetailScreen(
                                    state.companiesList[pieTouchResponse
                                        .touchedSection!.touchedSectionIndex],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                        sections: buildPieChartSection(
                            state.companiesList, state.totalCapitalization),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return const Placeholder();
        },
      ),
    );
  }

  List<PieChartSectionData> buildPieChartSection(
      List<CompanyEntity> companiesList, double totalCapitalization) {
    List<Color> colors = Colors.primaries;

    return List.generate(companiesList.length, (i) {
      const fontSize = 16.0;
      const radius = 50.0;

      return PieChartSectionData(
        color: colors[i],
        value: companiesList[i].marketCapitalization / totalCapitalization,
        title: companiesList[i].symbol,
        radius: radius,
        titleStyle: const TextStyle(
          fontSize: fontSize,
          color: Colors.black,
        ),
      );
    });
  }
}
