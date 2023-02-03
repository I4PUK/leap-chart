import 'package:chart_test/core/failure.dart';
import 'package:chart_test/domain/entities/company_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CompanyRepository {
  Future<Either<Failure, List<CompanyEntity>>> getAllCompanies();
}