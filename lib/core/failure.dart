import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final int? statusCode;
  final String? statusMessage;

  const Failure({this.statusCode, this.statusMessage});

  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure{
  const ServerFailure({super.statusCode, super.statusMessage}): super();
}