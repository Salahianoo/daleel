import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Configuration imports
import 'config/app_config.dart';
import 'config/dependency_injection.dart';

// API KEY: AIzaSyD9emtZq71D6H1WRAkfrUu1B0ZprBQ0Dd0
void main() {
  runApp(
    MultiBlocProvider(
      providers: DependencyInjection.providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // ignore: use_super_parameters
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppConfig.createApp(context);
  }
}
