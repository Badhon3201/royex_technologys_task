import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:royex_technologys_task/app/core/utils/api_service/api_service.dart';
import 'package:royex_technologys_task/app/core/utils/api_service/urls.dart';
import 'package:royex_technologys_task/app/core/utils/failure/app_error.dart';
import 'package:royex_technologys_task/app/data/models/issues_response_model.dart';
import 'package:royex_technologys_task/app/data/models/labels_response_model.dart';

class IssuesRepository {
  Future<Either<AppError, List<IssuesResponseModel>>> fetchIssuesList(
      {int? page, String? labels}) async {
    try {
      final res = await ApiService().getRequest(
        labels != null
            ? '${Urls.baseUrl}repos/flutter/flutter/issues?page=$page&labels=$labels'
            : '${Urls.baseUrl}repos/flutter/flutter/issues?page=$page',
      );
      debugPrint(res.statusCode.toString());
      if (res.statusCode == 200) {
        final decodedJson = json.decode(utf8.decode(res.bodyBytes));
        final issueResponseModel = <IssuesResponseModel>[];
        for (final issues in decodedJson) {
          final issueModel = IssuesResponseModel.fromJson(issues);
          issueResponseModel.add(issueModel);
        }
        return Right(issueResponseModel);
      } else {
        return const Left(AppError.httpError);
      }
    } on SocketException catch (e) {
      debugPrint(e.toString());
      return const Left(AppError.networkError);
    } catch (e) {
      debugPrint(e.toString());
      return const Left(AppError.unknownError);
    }
  }

  Future<Either<AppError, List<LabelsResponseModel>>> fetchLabelsList(
    String keyword,
  ) async {
    try {
      final res = await ApiService().getRequest(
        keyword.isEmpty
            ? '${Urls.baseUrl}repos/flutter/flutter/labels'
            : '${Urls.baseUrl}repos/flutter/flutter/labels/$keyword',
      );
      debugPrint(res.statusCode.toString());
      if (res.statusCode == 200) {
        final decodedJson = json.decode(utf8.decode(res.bodyBytes));
        final labelsResponseModel = <LabelsResponseModel>[];
        for (final labels in decodedJson) {
          final labelModel = LabelsResponseModel.fromJson(labels);
          labelsResponseModel.add(labelModel);
        }
        return Right(labelsResponseModel);
      } else {
        return const Left(AppError.httpError);
      }
    } on SocketException catch (e) {
      debugPrint(e.toString());
      return const Left(AppError.networkError);
    } catch (e) {
      debugPrint(e.toString());
      return const Left(AppError.unknownError);
    }
  }
}
