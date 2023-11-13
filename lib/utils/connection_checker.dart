import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityWrapper extends StatefulWidget {
  final Widget child;

  const ConnectivityWrapper({required this.child});

  @override
  _ConnectivityWrapperState createState() => _ConnectivityWrapperState();
}

class _ConnectivityWrapperState extends State<ConnectivityWrapper> {
  late StreamSubscription<ConnectivityResult> connectivitySubscription;
  bool isOnline = true; // Track the current connectivity state

  @override
  void initState() {
    super.initState();

    // Subscribe to connectivity changes
    connectivitySubscription = Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        // No internet connection
        if (isOnline) {
          _showSnackbar("No internet connection");
        }
        isOnline = false;
      } else {
        // Internet connection is available
        if (!isOnline) {
          _showSnackbar("Internet connection restored");
        }
        isOnline = true;
      }
    });
  }

  @override
  void dispose() {
    // Cancel the subscription when the widget is disposed
    connectivitySubscription.cancel();
    super.dispose();
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isOnline?  Colors.deepOrange : Colors.green,
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}