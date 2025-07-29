import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/domain/usecases/get_current_user_usecase.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/auth/presentation/pages/login_page.dart';

void main() {
  final authRemoteDataSource = AuthRemoteDataSource();
  final authRepository = AuthRepositoryImpl(authRemoteDataSource);
  runApp(
    MyApp(
      authCubit: AuthCubit(
        loginUseCase: LoginUseCase(authRepository),
        logoutUseCase: LogoutUseCase(authRepository),
        getCurrentUserUseCase: GetCurrentUserUseCase(authRepository),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthCubit authCubit;
  const MyApp({Key? key, required this.authCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: authCubit,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
