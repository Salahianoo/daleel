import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/auth/data/datasources/auth_remote_data_source.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/usecases/login_usecase.dart';
import '../features/auth/domain/usecases/logout_usecase.dart';
import '../features/auth/domain/usecases/get_current_user_usecase.dart';
import '../features/auth/presentation/cubit/auth_cubit.dart';
import '../core/language/language_cubit.dart';
import '../config/theme/theme_cubit.dart';

class DependencyInjection {
  static List<BlocProvider> get providers => [
    // Auth dependencies
    BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(
        loginUseCase: LoginUseCase(_getAuthRepository()),
        logoutUseCase: LogoutUseCase(_getAuthRepository()),
        getCurrentUserUseCase: GetCurrentUserUseCase(_getAuthRepository()),
      ),
    ),

    // App state dependencies
    BlocProvider<LanguageCubit>(create: (context) => LanguageCubit()),

    BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
  ];

  static AuthRepositoryImpl _getAuthRepository() {
    final authRemoteDataSource = AuthRemoteDataSource();
    return AuthRepositoryImpl(authRemoteDataSource);
  }
}
