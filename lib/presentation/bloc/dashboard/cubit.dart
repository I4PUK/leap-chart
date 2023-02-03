import 'package:chart_test/core/failure.dart';
import 'package:chart_test/domain/repositories/company_repository.dart';
import 'package:chart_test/presentation/bloc/dashboard/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final CompanyRepository companyRepository;
  double totalCapitalization = 0;

  DashboardCubit({required this.companyRepository}) : super(PersonEmpty());

  void loadCompanies() async {
    emit(const CompaniesLoading());

    final failureOrCompanies = await companyRepository.getAllCompanies();

    failureOrCompanies.fold(
      (error) => emit(CompaniesError(message: _mapFailureToMessage(error))),
      (companies) {
        companies.forEach((element) {
          totalCapitalization += element.marketCapitalization;
        });

        emit(CompaniesLoaded(companiesList: companies, totalCapitalization: totalCapitalization));
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return failure.statusMessage ?? 'Неизвестная ошибка';
      default:
        return "Неожиданная ошибка";
    }
  }
}
