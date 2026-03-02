import 'package:flutter/material.dart';
import 'package:flutter_test1/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedPageNotifier,
      builder: (context, currentIndex, child) {
        return NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            selectedPageNotifier.value = index;
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        );
      },
    );
  }
}