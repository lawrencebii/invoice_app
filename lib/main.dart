import 'package:flutter/material.dart';

import 'features/authentication/views/onboarding_screen.dart';
import 'features/navigation/views/navigation.dart';
import 'state_management_class.dart';
import 'utils/petite_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final token = StorageUtil.getString(key: 'token');
    return StateManagementClass(
      child: MaterialApp(
          title: 'Inventory System',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a blue toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            primaryColor: const Color(0xff31A062),
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xff31A062)),
            useMaterial3: true,
          ),
          home: token == null || token.toString().isEmpty
              ? const OnboardingScreen()
              : const Navigation()),
    );
  }
}
