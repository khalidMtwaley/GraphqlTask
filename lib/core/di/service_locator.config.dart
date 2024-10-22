// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:task/core/graphql_client.dart' as _i530;
import 'package:task/features/Auth/data/data_sources/auth_data_source.dart'
    as _i775;
import 'package:task/features/Auth/data/repositories_impl/auth_repo.dart'
    as _i19;
import 'package:task/features/Auth/presentation/blocs/cubit/auth_cubit.dart'
    as _i788;
import 'package:task/features/Requests/data/models/requests_response/requests_data_source.dart'
    as _i689;
import 'package:task/features/Requests/data/repository_impl/requests_repo.dart'
    as _i219;
import 'package:task/features/Requests/presentation/blocs/cubit/requests_cubit.dart'
    as _i728;

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
    gh.singleton<_i530.GraphQLService>(() => _i530.GraphQLService());
    gh.singleton<_i689.RequestsDataSource>(
        () => _i689.RequestsDataSourceImpl(gh<_i530.GraphQLService>()));
    gh.singleton<_i775.AuthDataSource>(
        () => _i775.AuthDataSourceImpl(gh<_i530.GraphQLService>()));
    gh.singleton<_i19.AuthRepo>(
        () => _i19.AuthRepoImpl(gh<_i775.AuthDataSource>()));
    gh.singleton<_i219.RequestsRepo>(
        () => _i219.RequestsRepoImpl(gh<_i689.RequestsDataSource>()));
    gh.factory<_i728.RequestsCubit>(
        () => _i728.RequestsCubit(gh<_i219.RequestsRepo>()));
    gh.lazySingleton<_i788.AuthCubit>(
        () => _i788.AuthCubit(gh<_i19.AuthRepo>()));
    return this;
  }
}
