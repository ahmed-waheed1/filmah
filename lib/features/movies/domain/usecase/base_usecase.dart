import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/network/api_error_model.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Either<ApiErrorModel, Type>> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();
  @override
  List<Object> get props => [];
}
