import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/dependency injection/get_it.dart';
import 'core/routes/app_router.dart';
import 'core/themes/app_theme.dart';
import 'core/widgets/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();

  runApp(
    ProviderScope(
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const FilmahApp(),
      ),
    ),
  );
}

class FilmahApp extends StatelessWidget {
  const FilmahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      fontSizeResolver: (fontSize, instance) {
        double clampedFontSize = instance.scaleText.clamp(.8, 1.2) * fontSize;
        return clampedFontSize;
      },
      builder: (context, child) => MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Filmah',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: MainNavigationView.routeName,
      ),
    );
  }
}
