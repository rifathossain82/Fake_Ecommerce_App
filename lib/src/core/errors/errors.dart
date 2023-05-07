abstract class BaseError {
  final String message;
  final int? statusCode;

  BaseError({
    required this.message,
    this.statusCode,
  });
}

class NetworkError extends BaseError {
  NetworkError({
    required super.message,
    super.statusCode,
  });
}

class BadRequestError extends BaseError {
  BadRequestError({
    required super.message,
    super.statusCode,
  });
}

class UnauthorizedError extends BaseError {
  UnauthorizedError({
    required super.message,
    super.statusCode,
  });
}

class PageNotFoundError extends BaseError {
  PageNotFoundError({
    required super.message,
    super.statusCode,
  });
}

class ServerError extends BaseError {
  ServerError({
    required super.message,
    super.statusCode,
  });
}

class ForbiddenError extends BaseError {
  ForbiddenError({
    required super.message,
    super.statusCode,
  });
}

class UnknownError extends BaseError {
  UnknownError({
    required super.message,
    super.statusCode,
  });
}
