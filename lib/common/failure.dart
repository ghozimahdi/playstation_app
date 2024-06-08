import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:ps5_99/common/localization.dart';
import 'package:ps5_99/core/exception/client_exception.dart';
import 'package:ps5_99/core/exception/connection_exception.dart';
import 'package:ps5_99/core/exception/permission_denied.dart';
import 'package:ps5_99/core/exception/server_exception.dart';
import 'package:ps5_99/generated/assets.gen.dart';

enum FailureType {
  permissionDenied,
  jsonSyntax,
  connection,
  unknown,
  server,
  client;
}

class Failure extends Equatable {
  final String? title;
  final String? message;
  final int? statusCode;
  final Widget? image;
  final FailureType type;

  const Failure({
    this.title,
    this.message,
    this.statusCode,
    this.image,
    this.type = FailureType.unknown,
  });

  @override
  List<Object?> get props => [
        title,
        message,
        statusCode,
        image,
        type,
      ];

  static Future<Failure> fromException(dynamic e) async {
    switch (e.runtimeType) {
      case const (ServerException):
        return Failure(
          title: cw.error_general_title.t,
          message: cw.error_general_subtitle.t,
          image: Image.asset(AppAssets.images.imgServerError.path),
          type: FailureType.server,
        );
      case const (ConnectionException):
        return Failure(
          title: cw.error_connection_title.t,
          message: cw.error_connection_subtitle.t,
          image: Image.asset(AppAssets.images.imgServerError.path),
          type: FailureType.connection,
        );
      case final ClientException e:
        return Failure(
          message: e.message,
          statusCode: e.response?.statusCode ?? 0,
          image: Image.asset(AppAssets.images.imgServerError.path),
          type: FailureType.client,
        );
      case const (PermissionDenied):
        return Failure(
          type: FailureType.permissionDenied,
          image: Image.asset(AppAssets.images.imgServerError.path),
        );
      default:
        return Failure(
          title: cw.error_general_title.t,
          message: cw.error_general_subtitle.t,
          image: Image.asset(AppAssets.images.imgServerError.path),
        );
    }
  }
}

extension FailureTypeExt on FailureType {
  bool get connection => this == FailureType.connection;
  bool get permissionDenied => this == FailureType.permissionDenied;
  bool get jsonSyntax => this == FailureType.jsonSyntax;
  bool get unknown => this == FailureType.unknown;
  bool get server => this == FailureType.server;
  bool get client => this == FailureType.client;
}
