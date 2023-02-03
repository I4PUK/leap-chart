import 'package:chart_test/presentation/bloc/dashboard/cubit.dart';
import 'package:chart_test/presentation/screens/dashboard_screen.dart';
import 'package:chart_test/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardCubit>(
      create: (context) => sl<DashboardCubit>()..loadCompanies(),
      child: MaterialApp(
        home: const DashboardScreen(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // onGenerateRoute: (settings) {
        //   return RouteGenerator.generateRoute(settings);
        // },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
