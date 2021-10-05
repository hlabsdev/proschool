// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:proschool/core/error/exception.dart';
import 'package:proschool/core/error/failure.dart';
import 'package:proschool/core/network/network_info.dart';
import 'package:proschool/core/utils/core_constantes.dart';
import 'package:proschool/core/utils/data_constantes_utils.dart';
import 'package:proschool/features/common/data/datasources/remote/api.dart';
import 'package:proschool/features/common/data/dto/connection_dto.dart';
import 'package:proschool/features/common/data/dto/inscription_dto.dart';
import 'package:proschool/features/common/data/models/app_response_model.dart';
import 'package:proschool/features/common/data/models/register_model.dart';

class ApiRepository implements Api {
  Dio dio = Dio();
  final NetworkInfo networkInfo = NetworkInfoImpl(DataConnectionChecker());

  ApiRepository() {
    // or new Dio with a BaseOptions instance.
    BaseOptions options = BaseOptions(
      baseUrl: SERVER_URL,
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );
    dio = Dio(options);
  }

/*  Future<Dio> getApiClient() async {
    var token = "";
    dio.interceptors.clear();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // Do something before request is sent
      options.headers["Authorization"] = "Bearersend_message " + token;
      return options;
    }, onResponse: (Response response) {
      // Do something with response data
      return response; // continue
    }, onError: (DioError error) async {
      // Do something with response error
      if (error.response?.statusCode == 403) {
        dio.interceptors.requestLock.lock();
        dio.interceptors.responseLock.lock();
        RequestOptions options = error.response.request;
        //refresh token
        //token = await user.getIdToken(refresh: true);

        options.headers["Authorization"] = "Bearer " + token;

        dio.interceptors.requestLock.unlock();
        dio.interceptors.responseLock.unlock();
        return dio.request(options.path, options: options);
      } else {
        return error;
      }
    }));
    //dio.options.baseUrl = baseUrl;
    return dio;
  }*/

  @override
  Future<Either<Failure, AppResponseModel>> refreshLocation(
      ConnectionDto connectionDto) async {
    if (await networkInfo.isConnected) {
      try {
        String fullData = connectionDto.toGetMap();

        var response = await dio
            .get("${DataConstantesUtils.RLOCATION_SERVER_URL}?$fullData");

        //var data = response.data;
        var data = response.toString();

        Map<String, dynamic> responseMap = jsonDecode(data);
        return Right((AppResponseModel.fromMap(responseMap)));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        return Right(AppResponseModel());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, AppResponseModel>> login(
      ConnectionDto connectionDto) async {
    if (await networkInfo.isConnected) {
      try {
        String fullData = connectionDto.toGetMap();

        var response =
            await dio.get("${DataConstantesUtils.LOGIN_SERVER_URL}?$fullData");

        var data = response.toString();

        Map<String, dynamic> responseMap = jsonDecode(data);
        return Right((AppResponseModel.fromMap(responseMap)));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        return Right(AppResponseModel());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, AppResponseModel>> updatePassword(
      ConnectionDto connectionDto) async {
    if (await networkInfo.isConnected) {
      try {
        String fullData = connectionDto.toGetMap();

        var response = await dio
            .get("${DataConstantesUtils.UPASSWORD_SERVER_URL}?$fullData");

        //var data = response.data;
        var data = response.toString();

        Map<String, dynamic> responseMap = jsonDecode(data);
        return Right((AppResponseModel.fromMap(responseMap)));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        return Right(AppResponseModel());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, AppResponseModel>> updateProfil(
      InscriptionDto inscriptionDto) async {
    if (await networkInfo.isConnected) {
      try {
        String fullData = inscriptionDto.toGetMap();

        var response = await dio
            .get("${DataConstantesUtils.RPROFIL_SERVER_URL}?$fullData");

        var data = response.toString();

        Map<String, dynamic> responseMap = jsonDecode(data);
        return Right((AppResponseModel.fromMap(responseMap)));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        return Right(AppResponseModel());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, AppResponseModel>> confirmRegistration(
      ConnectionDto connectionDto) async {
    if (await networkInfo.isConnected) {
      try {
        String fullData = connectionDto.toGetMap();

        var response = await dio
            .get("${DataConstantesUtils.FREGISTER_SERVER_URL}?$fullData");

        var data = response.toString();

        Map<String, dynamic> responseMap = jsonDecode(data);
        return Right((AppResponseModel.fromMap(responseMap)));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        return Right(AppResponseModel());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> registration(
      InscriptionDto inscriptionDto) async {
    if (await networkInfo.isConnected) {
      try {
        String fullData = inscriptionDto.toGetMap();

        var response = await dio
            .get("${DataConstantesUtils.REGISTER_SERVER_URL}?$fullData");

        //var data = response.data;
        var data = response.toString();

        Map<String, dynamic> responseMap = jsonDecode(data);
        return Right((RegisterModel.fromMap(responseMap)));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        return Right(RegisterModel());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, AppResponseModel>> forgetPassord(
      ConnectionDto connectionDto) async {
    if (await networkInfo.isConnected) {
      try {
        String fullData = connectionDto.toGetMap();

        var response =
            await dio.get("${DataConstantesUtils.FORGET_SERVER_URL}?$fullData");

        //var data = response.data;
        var data = response.toString();

        Map<String, dynamic> responseMap = jsonDecode(data);
        return Right((AppResponseModel.fromMap(responseMap)));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        return Right(AppResponseModel());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, AppResponseModel>> resetPassword(
      ConnectionDto connectionDto) async {
    if (await networkInfo.isConnected) {
      try {
        String fullData = connectionDto.toGetMap();
        String fullUrl = "${DataConstantesUtils.RESET_SERVER_URL}?$fullData";

        var response = await dio.get(fullUrl);
        print(response.toString());

        //var data = response.data;
        var data = response.toString();

        Map<String, dynamic> responseMap = jsonDecode(data);
        return Right((AppResponseModel.fromMap(responseMap)));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        return Right(AppResponseModel());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  /*End*/
}
