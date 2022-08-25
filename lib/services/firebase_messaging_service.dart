import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:calcugasliter/services/connectivity_manager.dart';
import 'package:calcugasliter/widgets/Custom_SnackBar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../utils/network_strings.dart';

class FirebaseMessagingService {
  static ConnectivityManager? _connectivityManager;
  static FirebaseMessagingService? _messagingService;
  static FirebaseMessaging? _firebaseMessaging;
  FirebaseMessagingService._createInstance();
  factory FirebaseMessagingService() {
    // factory with constructor, return some value
    if (_messagingService == null) {
      _messagingService = FirebaseMessagingService
          ._createInstance(); // This is executed only once, singleton object
      _firebaseMessaging = _getMessagingService();
      _connectivityManager = ConnectivityManager();
    }
    return _messagingService!;
  }
  static FirebaseMessaging _getMessagingService() {
    return _firebaseMessaging ??= FirebaseMessaging.instance;
  }

  Future<String?> getToken() async {
    if (await _connectivityManager!.isInternetConnected()) {
      return _firebaseMessaging!.getToken();
    } else {
      customSnackBar('No Internet Connection');
      return null;
    }
  }
}
