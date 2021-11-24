// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../services/auth/auth.dart';
import '../services/auth/auth_provider.dart';
import '../services/database/db.dart';
import '../services/database/db_services.dart';
import '../services/auth/i_auth.dart';
import '../services/database/i_db.dart';
import '../services/auth/valudator.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<IAuth>(() => AuthImpl());
  gh.factory<IDb>(() => Db());
  gh.lazySingleton<Valudator>(() => Valudator());
  gh.factory<AuthServices>(() => AuthServices(get<IAuth>()));
  gh.factory<DbServices>(() => DbServices(get<IDb>()));
  return get;
}
