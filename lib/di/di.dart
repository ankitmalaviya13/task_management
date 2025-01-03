import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:task_management/providers/Authentication/auth_provider.dart';

import '../core/common_providers/password_visibility_provider.dart';
import '../providers/splash_provider.dart';
import '../services/Api/AuthApiService.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton(() => AuthApiService());
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => AuthProvider()),
  ChangeNotifierProvider(create: (_) => SplashProvider()),
  ChangeNotifierProvider(create: (_) => PasswordVisibilityProvider()),
];
