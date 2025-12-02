// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dalil_hama/configuration.dart' as _i50;
import 'package:dalil_hama/features/auth/presentation/cubit/auth_cubit.dart'
    as _i32;
import 'package:dalil_hama/features/core/presentation/utils/file_manager.dart'
    as _i747;
import 'package:dalil_hama/injectable_module.dart' as _i1057;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

const String _dev = 'dev';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectableModule = _$InjectableModule();
    gh.singleton<_i32.AuthCubit>(() => _i32.AuthCubit());
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => injectableModule.sharedPref,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dioInstance);
    gh.lazySingleton<_i974.Logger>(() => injectableModule.logger);
    gh.singleton<_i50.Configuration>(
      () => _i50.DevConfiguration(),
      registerFor: {_dev},
    );
    gh.singleton<_i747.FileManager>(
      () => _i747.FileManager(gh<_i50.Configuration>()),
    );
    return this;
  }
}

class _$InjectableModule extends _i1057.InjectableModule {}
