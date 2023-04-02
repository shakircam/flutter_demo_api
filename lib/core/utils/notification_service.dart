
import 'dart:io';
import 'dart:math';

import 'package:app_settings/app_settings.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/core/utils/route_services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {

  //initialising firebase message plugin
  FirebaseMessaging messaging = FirebaseMessaging.instance ;

  //initialising firebase message plugin
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin  = FlutterLocalNotificationsPlugin();

  // function to request notifications permissions
  void requestNotificationPermission()async{
    NotificationSettings settings = await messaging.requestPermission(
        alert: true ,
        announcement: true ,
        badge: true ,
        carPlay:  true ,
        criticalAlert: true ,
        provisional: true ,
        sound: true
    );

    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print('user granted permission');
    }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      print('user granted provisional permission');
    }else {
      AppSettings.openNotificationSettings();
      print('user denied permission');
    }
  }


  //function to initialise flutter local notification plugin to show notifications for android when app is active
  void initLocalNotifications(BuildContext context, RemoteMessage message)async{

    var androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');

    const IOSInitializationSettings iosInitializationSettings =
    IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings ,
        iOS: iosInitializationSettings
    );

    await _flutterLocalNotificationsPlugin.initialize(
        initializationSetting,
        onSelectNotification: (payload){
          // handle interaction when app is active for android
          handleMessage(context, message);
        }
    );
  }

  void firebaseInit(BuildContext context){

    FirebaseMessaging.onMessage.listen((message) {
      if (kDebugMode) {
        print("fcm foreground ${message.notification!.title.toString()}");
        print("fcm foreground ${message.notification!.body.toString()}");
        print("fcm foreground ${message.data.toString()}");
      }

      //show notifications when app is active
      if(Platform.isAndroid){
        //calling this function to handle internation
        initLocalNotifications(context , message);
        showNotification(message);
      }else {
        showNotification(message);
      }
    });
  }

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final dio = Dio();
    await dio.download(url, filePath);
    return filePath;
  }

  // function to show visible notification when app is active
  Future<void> showNotification(RemoteMessage message)async{

    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(),
        'notification_channel_name',
        importance: Importance.max
    );


    final String largeIconPath = await _downloadAndSaveFile(
        '${message.notification?.android?.imageUrl}', 'largeIcon');
    final String bigPicturePath = await _downloadAndSaveFile(
        '${message.notification?.android?.imageUrl}', 'bigPicture');

    final BigPictureStyleInformation bigPictureStyleInformation =
    BigPictureStyleInformation(
        FilePathAndroidBitmap(bigPicturePath),
        largeIcon: FilePathAndroidBitmap(largeIconPath),
        contentTitle: '${message.notification?.title}',
        htmlFormatContentTitle: true,
        summaryText: '${message.notification?.body}',
        htmlFormatSummaryText: true,
        hideExpandedLargeIcon: true);

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        channel.id.toString(),
        channel.name.toString() ,
        channelDescription: 'your channel description',
        importance: Importance.high,
        priority: Priority.high ,
        ticker: 'ticker',
        styleInformation: bigPictureStyleInformation,
        largeIcon: FilePathAndroidBitmap(largeIconPath)
    );


    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails);

    Future.delayed(Duration.zero , (){
      _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });

  }

  //function to get device token on which we will send the notifications
  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh()async{
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      if (kDebugMode) {
        print('refresh');
      }
    });
  }

  //handle tap on notification when app is in background or terminated
  Future<void> setupInteractMessage(BuildContext context)async{

    // when app is terminated
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if(initialMessage != null){
      handleMessage(context, initialMessage);
    }

    //when app ins background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message) {

    if(message.data['type'] =='msj'){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ProductPage(
            productId: message.data['id'] ,
          )));
    }
  }


}