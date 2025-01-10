import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:task_management/providers/Authentication/auth_provider.dart';

import '../core/common_providers/password_visibility_provider.dart';
import '../providers/splash_provider.dart';
import '../services/Api/auth_api_service.dart';
import '../services/Api/profile_api_service.dart';
import '../services/Api/project_api_service.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton(() => AuthApiService());
  getIt.registerLazySingleton(() => ProfileApiService());
  getIt.registerLazySingleton(() => ProjectApiService());
  getIt.registerLazySingleton(() => AuthProvider());
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => GetIt.instance<AuthProvider>()),
  ChangeNotifierProvider(create: (_) => SplashProvider()),
  ChangeNotifierProvider(create: (_) => PasswordVisibilityProvider()),
];
