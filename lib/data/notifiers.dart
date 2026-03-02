import 'package:flutter/material.dart';

/// Notifier for the selected page index in the bottom navigation bar
final ValueNotifier<int> selectedPageNotifier = ValueNotifier<int>(0);

/// Notifier for dark mode toggle
final ValueNotifier<bool> isDarkModeNotifier = ValueNotifier<bool>(true);
