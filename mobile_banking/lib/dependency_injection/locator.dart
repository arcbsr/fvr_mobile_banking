

// GetIt is a package used for service locator or to manage dependency injection
import 'package:get_it/get_it.dart';

import '../features/login/auth_api/auth_api_repository.dart';
import '../features/login/auth_api/auth_http_api_repository.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  void servicesLocator() {
    getIt.registerLazySingleton<AuthApiRepository>(() => AuthHttpApiRepository()); // Registering AuthHttpApiRepository as a lazy singleton for AuthApiRepository
    //
  }

}

