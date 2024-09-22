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
import 'package:track_wise/src/core/cache/cache_manager.dart' as _i85;
import 'package:track_wise/src/core/cache/hive/hive_cache_manager.dart'
    as _i113;
import 'package:track_wise/src/core/cache/shared_preferences/shared_preferences_manager.dart'
    as _i661;
import 'package:track_wise/src/core/connection/network_info.dart' as _i198;
import 'package:track_wise/src/core/injection/injection_module.dart' as _i629;
import 'package:track_wise/src/feature/expenses/data/repositories/expense_repository_impl.dart'
    as _i854;
import 'package:track_wise/src/feature/expenses/data/sources/local/expense_local_data_source.dart'
    as _i994;
import 'package:track_wise/src/feature/expenses/data/sources/remote/expense_remote_data_source.dart'
    as _i387;
import 'package:track_wise/src/feature/expenses/domain/repositories/expense_repository.dart'
    as _i37;
import 'package:track_wise/src/feature/expenses/domain/usecases/create_expense.dart'
    as _i719;
import 'package:track_wise/src/feature/expenses/domain/usecases/get_expenses.dart'
    as _i1068;
import 'package:track_wise/src/feature/expenses/presentation/bloc/expense_bloc.dart'
    as _i1036;

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
    gh.singleton<_i661.SharedPreferencesManager>(
        () => _i661.SharedPreferencesManager());
    gh.singleton<_i198.NetworkInfo>(() => _i198.NetworkInfo());
    gh.singleton<_i372.NetworkManager>(() => injectionModule.manager);
    gh.lazySingleton<_i994.ExpenseLocalDataSource>(
        () => _i994.ExpenseLocalDataSourceImpl());
    gh.factory<_i85.CacheManager<dynamic>>(
        () => _i113.HiveCacheManager<dynamic>(gh<String>()));
    gh.factory<_i387.ExpenseRemoteDataSource>(
        () => _i387.ExpenseRemoteDataSourceImpl(gh<_i372.NetworkManager>()));
    gh.factory<_i37.ExpenseRepository>(() => _i854.ExpenseRepositoryImpl(
          gh<_i387.ExpenseRemoteDataSource>(),
          gh<_i994.ExpenseLocalDataSource>(),
          gh<_i198.NetworkInfo>(),
        ));
    gh.factory<_i1068.GetExpensesUseCase>(
        () => _i1068.GetExpensesUseCase(gh<_i37.ExpenseRepository>()));
    gh.factory<_i719.CreateExpenseUseCase>(
        () => _i719.CreateExpenseUseCase(gh<_i37.ExpenseRepository>()));
    gh.factory<_i1036.ExpenseBloc>(() => _i1036.ExpenseBloc(
          gh<_i719.CreateExpenseUseCase>(),
          gh<_i1068.GetExpensesUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i629.InjectionModule {}
