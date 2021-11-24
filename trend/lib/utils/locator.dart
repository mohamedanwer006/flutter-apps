import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:trend/utils/locator.config.dart';

final getIt = GetIt.instance;

@injectableInit
// (
//   initializerName: r'$initGetIt', // default
//   preferRelativeImports: true, // default
//   asExtension: false, // default
// )
void configureDependencies() => $initGetIt(getIt);
