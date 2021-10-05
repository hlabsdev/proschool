import 'package:dartz/dartz.dart';
import 'package:proschool/core/error/failure.dart';
import 'package:proschool/features/common/data/dto/connection_dto.dart';
import 'package:proschool/features/common/data/dto/inscription_dto.dart';
import 'package:proschool/features/common/data/models/app_response_model.dart';
import 'package:proschool/features/common/data/models/register_model.dart';

abstract class Api {
  Future<Either<Failure, RegisterModel>> registration(
      InscriptionDto inscriptionDto);

  Future<Either<Failure, AppResponseModel>> updatePassword(
      ConnectionDto connectionDto);

  Future<Either<Failure, AppResponseModel>> login(ConnectionDto connectionDto);

  Future<Either<Failure, AppResponseModel>> refreshLocation(
      ConnectionDto connectionDto);

  Future<Either<Failure, AppResponseModel>> updateProfil(
      InscriptionDto inscriptionDto);

  Future<Either<Failure, AppResponseModel>> forgetPassord(
      ConnectionDto connectionDto);

  Future<Either<Failure, AppResponseModel>> confirmRegistration(
      ConnectionDto connectionDto);

  Future<Either<Failure, AppResponseModel>> resetPassword(
      ConnectionDto connectionDto);
}
