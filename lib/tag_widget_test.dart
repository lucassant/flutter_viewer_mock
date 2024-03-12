import 'dart:convert';
import 'dart:io';

import 'package:commons/network/network_provider.dart';
import 'package:dio_export/dio.dart';

import '../utils/exceptions.dart';

class DataSourceBase {
  DataSourceBase(this.client);

  final NetworkProvider client;

  Future<R> makeGet<R>({
    required String url,
    required R Function(Map<String, dynamic>) returnMapper,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Dio dioInstance = await client.getDioInstanceForURL();

    try {
      final response = await dioInstance.get(
        url,
        queryParameters: queryParameters,
      );

      switch (response.statusCode) {
        case HttpStatus.ok:
          try {
            return returnMapper(json.decode(response.data));
          } catch (e) {
            throw ObjectMapException(
              message: 'Erro na conversão do json do servidor para uma classe: ${e.toString()}',
            );
          }
        default:
          throw getExeption(response);
      }
    } catch (e) {
      if (e is FinancialPlanningException) {
        rethrow;
      }

      if (e is DioException) {
        throw ServerException(message: e.message ?? '');
      }

      throw Exception(e.toString());
    }
  }

  Future<void> makePost({
    required String url,
    required Map<String, String> data,
  }) async {
    final Dio dioInstance = await client.getDioInstanceForURL();

    try {
      final response = await dioInstance.post(
        url,
        data: json.encode(data),
      );
      switch (response.statusCode) {
        case HttpStatus.created:
          return;
        default:
          throw getExeption(response);
      }
    } catch (e) {
      if (e is FinancialPlanningException) {
        rethrow;
      }

      if (e is DioException) {
        throw ServerException(message: e.message ?? '');
      }

      throw Exception(e.toString());
    }
  }

  Exception getExeption(Response<dynamic> response) {
    switch (response.statusCode) {
      case HttpStatus.badRequest:
        throw BadRequestException(
          message: 'Erro nos dados enviado para o servidor. ${response.exceptionMessage}',
        );
      case HttpStatus.noContent:
        throw NoContentException(message: response.exceptionMessage);
      default:
        throw ServerException(
          message: 'Erro na chamada executada ao servidor. ${response.exceptionMessage}',
        );
    }
  }
}

extension MessageErro on Response<dynamic> {
  String get exceptionMessage => 'StatusMessage: $statusMessage. Data:  ${data.toString()}';
}
