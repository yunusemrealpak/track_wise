import 'typedefs.dart';

abstract interface class UseCase<Type, Params> {
  EitherFuture<Type> call(Params params);
}

abstract interface class UseCaseWithoutParams<Type> {
  EitherFuture<Type> call();
}
