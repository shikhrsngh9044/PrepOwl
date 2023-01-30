import 'package:dartz/dartz.dart';

typedef APIResponse<T> = Either<Failure, T>;

// class Success<T> {
//   final int code;
//   final T response;

//   Success({
//     required this.code,
//     required this.response,
//   });
// }

class Failure {
  final int code;
  final Object response;

  Failure({
    required this.code,
    required this.response,
  });
}
