import 'package:dars_3_9_uy_ishi/main.dart';
import 'package:dars_3_9_uy_ishi/services/auth_http_services.dart';
import 'package:dars_3_9_uy_ishi/views/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppLocalizations.of(context)!.menu,
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/main");
            },
            title: Text(
              AppLocalizations.of(context)!.mainpage,
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/todo");
            },
            title: Text(
              AppLocalizations.of(context)!.todo,
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/note");
            },
            title: Text(
              AppLocalizations.of(context)!.note,
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/settings");
            },
            title: Text(
              AppLocalizations.of(context)!.settings,
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          ListTile(
            onTap: () {
              AuthHttpServices.logout();
              MyApp.loginCheck = true;
              AuthHttpServices.loginCheckhistory(true);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
            },
            title: Text(
              AppLocalizations.of(context)!.logout,
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
        ],
      ),
    );
  }
}
