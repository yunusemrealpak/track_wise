// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:network/network.dart' as _i372;
import 'package:track_wise/core/injection/injection_module.dart' as _i445;
import 'package:track_wise/src/feature/expenses/data/repositories/expense_repository_impl.dart'
    as _i854;
import 'package:track_wise/src/feature/expenses/data/sources/expense_remote_data_source.dart'
    as _i985;
import 'package:track_wise/src/feature/expenses/domain/repositories/expense_repository.dart'
    as _i37;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.singleton<_i372.NetworkManager>(() => injectionModule.manager);
    gh.factory<_i985.ExpenseRemoteDataSource>(
        () => _i985.ExpenseRemoteDataSourceImpl(gh<_i372.NetworkManager>()));
    gh.factory<_i37.ExpenseRepository>(
        () => _i854.ExpenseRepositoryImpl(gh<_i985.ExpenseRemoteDataSource>()));
    return this;
  }
}

class _$InjectionModule extends _i445.InjectionModule {}
