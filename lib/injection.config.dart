// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_package/core_package.dart' as _i996;
import 'package:dalil_hama/configuration.dart' as _i50;
import 'package:dalil_hama/features/auth/presentation/cubit/auth_cubit.dart'
    as _i32;
import 'package:dalil_hama/features/core/presentation/utils/file_manager.dart'
    as _i747;
import 'package:dalil_hama/features/post/data/repository/post_repository_impl.dart'
    as _i759;
import 'package:dalil_hama/features/post/data/source/remote_source/post_remote_source.dart'
    as _i378;
import 'package:dalil_hama/features/post/domain/repository/post_repository.dart'
    as _i714;
import 'package:dalil_hama/features/post/presentation/cubit/posts_get_cubit.dart'
    as _i404;
import 'package:dalil_hama/features/sections/data/repository/sections_repo_impl.dart'
    as _i343;
import 'package:dalil_hama/features/sections/data/source/sections_source.dart'
    as _i439;
import 'package:dalil_hama/features/sections/domain/repository/sections_repo.dart'
    as _i365;
import 'package:dalil_hama/injectable_module.dart' as _i1057;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

const String _dev = 'dev';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectableModule = _$InjectableModule();
    gh.singleton<_i32.AuthCubit>(() => _i32.AuthCubit());
    gh.lazySingleton<_i996.Dio>(() => injectableModule.dioInstance);
    gh.lazySingleton<_i974.Logger>(() => injectableModule.logger);
    gh.singleton<_i50.Configuration>(
      () => _i50.DevConfiguration(),
      registerFor: {_dev},
    );
    gh.factory<_i439.SectionsSource>(
      () => _i439.SectionsSourceImpl(gh<_i996.Dio>(), gh<_i50.Configuration>()),
    );
    gh.factory<_i378.PostRemoteSource>(
      () =>
          _i378.PostRemoteSourceImpl(gh<_i996.Dio>(), gh<_i50.Configuration>()),
    );
    gh.singleton<_i747.FileManager>(
      () => _i747.FileManager(gh<_i50.Configuration>()),
    );
    gh.lazySingleton<_i365.SectionsRepo>(
      () => _i343.SectionsRepoImpl(gh<_i439.SectionsSource>()),
    );
    gh.factory<_i714.PostRepository>(
      () => _i759.PostRepositoryImpl(gh<_i378.PostRemoteSource>()),
    );
    gh.factory<_i404.PostsGetCubit>(
      () => _i404.PostsGetCubit(gh<_i714.PostRepository>()),
    );
    return this;
  }
}

class _$InjectableModule extends _i1057.InjectableModule {}
