import 'package:equatable/equatable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
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
  final SvgPicture? image;
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
          title: null,
          message: null,
          image: null,
          type: FailureType.server,
        );
      case const (ConnectionException):
        return Failure(
          title: null,
          message: null,
          image: null,
          type: FailureType.connection,
        );
      case final ClientException e:
        return Failure(
          message: e.message,
          statusCode: e.response?.statusCode ?? 0,
          image: null,
          type: FailureType.client,
        );
      case const (PermissionDenied):
        return const Failure(
          type: FailureType.permissionDenied,
        );
      default:
        return Failure(
          title: '',
          message: '',
          image: null,
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
