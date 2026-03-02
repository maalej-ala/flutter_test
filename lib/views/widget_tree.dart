import 'package:flutter/material.dart';
import 'package:flutter_test1/data/constants.dart';
import 'package:flutter_test1/data/notifiers.dart';
import 'package:flutter_test1/views/pages/home_page.dart';
import 'package:flutter_test1/views/pages/profile_page.dart';
import 'package:flutter_test1/views/pages/settings_page.dart';
import 'package:flutter_test1/views/widgets/navbar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = [
  const HomePage(),
  const ProfilePage(),
];
class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Widget Tree"),
            actions: [
              IconButton(
                onPressed: () async {
                  final newValue = !isDarkModeNotifier.value;
                  isDarkModeNotifier.value = newValue;
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setBool(Kconstants.isDarkModeKey, newValue);
                },
                icon: ValueListenableBuilder(
                  valueListenable: isDarkModeNotifier,
                  builder: (context, isDarkMode, child) {
                    return Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode);
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
                },
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          body: pages.elementAt(selectedPage),
          bottomNavigationBar: (selectedPage == 0 || selectedPage == 1)
              ? NavbarWidget()
              : null,
        );
      },
    );
  }
}