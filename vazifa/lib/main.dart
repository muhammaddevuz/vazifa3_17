import 'package:dars_3_9_uy_ishi/services/auth_http_services.dart';
import 'package:dars_3_9_uy_ishi/utils/app_constants.dart';
import 'package:dars_3_9_uy_ishi/views/screens/login_screen.dart';
import 'package:dars_3_9_uy_ishi/views/screens/main_screen.dart';
import 'package:dars_3_9_uy_ishi/views/screens/manage_expense_screen.dart';
import 'package:dars_3_9_uy_ishi/views/screens/note_screen.dart';
import 'package:dars_3_9_uy_ishi/views/screens/settings_screen.dart';
import 'package:dars_3_9_uy_ishi/views/screens/todo_screens.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static bool loginCheck = true;
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool("loginCheck") != null) {
      MyApp.loginCheck = sharedPreferences.getBool("loginCheck")!;
      setState(() {});
    }
    if (sharedPreferences.getString("expiryDate") != null) {
      DateTime box = DateTime.parse(sharedPreferences.getString("expiryDate")!);
      DateTime now = DateTime.now();
      if (box.isBefore(now)) {
        MyApp.loginCheck = true;
        AuthHttpServices.logout();
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          "/main": (context) => const MainScreen(),
          "/todo": (context) => const ToDoScreen(),
          "/note": (context) => const NoteScreen(),
          "/settings": (context) => const SettingsScreen(),
          "/manage": (context) => const ManageNoteScreen(),
        },
        locale: Locale(AppConstants.language),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        home: MyApp.loginCheck ? const LoginScreen() : const MainScreen());
  }
}
