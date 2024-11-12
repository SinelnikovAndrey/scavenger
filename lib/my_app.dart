import 'package:daily_scavenger/presentation/pages/home/home_page.dart';
import 'package:daily_scavenger/presentation/utils/app_colors.dart';
import 'package:daily_scavenger/presentation/utils/app_router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scavenger',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.all<Color>(
            AppColors.primary,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: const HomePage(),
    );
  }
}