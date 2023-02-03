import 'package:chart_test/domain/entities/company_entity.dart';
import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable{
  const DashboardState();

  @override
  List<Object?> get props => [];
}

class PersonEmpty extends DashboardState{
  @override
  List<Object?> get props => [];
}

class CompaniesLoading extends DashboardState{
  const CompaniesLoading();
}

class CompaniesLoaded extends DashboardState{
  final List<CompanyEntity> companiesList;
  final double totalCapitalization;

  const CompaniesLoaded({required this.companiesList, required this.totalCapitalization});

  @override
  List<Object?> get props => [companiesList];
}

class CompaniesError extends DashboardState{
  final String message;

  const CompaniesError({required this.message});

  @override
  List<Object?> get props => [message];
}