import 'package:chart_test/common/api_symbols.dart';
import 'package:chart_test/core/failure.dart';
import 'package:chart_test/data/data_source/api_data_source.dart';
import 'package:chart_test/data/models/company_model.dart';
import 'package:chart_test/domain/entities/company_entity.dart';
import 'package:chart_test/domain/repositories/company_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CompanyRepositoryImpl extends CompanyRepository {
  final ApiDataSource apiDataSource;

  CompanyRepositoryImpl(this.apiDataSource);

  @override
  Future<Either<Failure, List<CompanyEntity>>> getAllCompanies() async {
    try {
      var tickers = [
        ApiSymbols.apple,
        ApiSymbols.amazon,
        ApiSymbols.facebook,
        ApiSymbols.microsoft,
        ApiSymbols.google
      ];

      List<CompanyModel> resultList = [];

      for (String element in tickers) {
        Response<Map<String, dynamic>> apiResult =
        await apiDataSource.get<Map<String, dynamic>>(requestParams: {
          'function': 'OVERVIEW',
          'symbol': element,
        });

        if (apiResult.data != null && apiResult.data!.isNotEmpty) {
          CompanyModel parsedCompany = CompanyModel.fromMap(apiResult.data!);
          resultList.add(parsedCompany);
        }
      }

      return Right(resultList);
    } catch (e) {
      return Left(ServerFailure(statusMessage: e.toString()));
    }
  }

  // Future<Either<Failure, Object>> _apiRequest({
  //   required String path,
  //   Function(Response<dynamic> json)? decodeFunction,
  //   Map<String, dynamic>? requestParameters,
  // }) async {
  //   ResultApi apiResult = await apiDataSource.get(
  //           path: path, requestParams: requestParameters);
  //
  //   ResultApi r = ResultApi(
  //     code: apiResult.code,
  //     message: apiResult.message,
  //   );
  //   if (decodeFunction != null) {
  //     r.data = decodeFunction(apiResult.data);
  //   }
  //
  //   return Right(r);
  // }
}
