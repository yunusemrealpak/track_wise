import 'package:dartz/dartz.dart';

import '../models/failure.dart';

typedef EitherFuture<T> = Future<Either<Failure, T>>;
typedef EitherVoid = EitherFuture<void>;
typedef DataMap = Map<String, dynamic>;
typedef DataList = List<Map<String, dynamic>>;
