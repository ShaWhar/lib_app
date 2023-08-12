import 'dart:async';
import 'package:flutter/foundation.dart';

class Debouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback actionToDebounce) {
    // Cancel any previous timer to avoid multiple executions
    _timer?.cancel();

    // Set a new timer to execute the action after the specified delay
    _timer = Timer(Duration(milliseconds: milliseconds), actionToDebounce);
  }
}
