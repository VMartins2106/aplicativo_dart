import 'package:flutter/material.dart';
import 'package:firebase/app_routes_notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AppRoutes{

  static const HOME = '/';
  static const SIGNUP = '/sign-up';
  static const RESET_PASSWORD = '/reset_password';
  static const TELA_INICIAL = '/inicio';
  static const TREINADORES = '/inicio/treinadores';
  static const TREINO_JOHANN = '/inicio/treinadores/treino_johann';
  static const TREINO_RONNIE = '/inicio/treinadores/treino_ronnie';
  static const TREINO_BREIER = '/inicio/treinadores/treino_breier';
  static const TREINO_ZYZZ = '/inicio/treinadores/treino_zyzz';
  static const TREINO_EDDIE = '/inicio/treinadores/treino_eddie';
  static const TREINO_JAY = '/inicio/treinadores/treino_jay';
  static const TREINO_ARNOLD = '/inicio/treinadores/treino_arnold';
  static const TREINO_BAMBAM = '/inicio/treinadores/treino_bambam';
  static const INFO = '/inicio/info';
  static const PROFILE = '/inicio/perfil';
  static const EDIT_PROFILE = '/inicio/perfil/edit';
  static const FETCH = '/inicio/perfil/fetch';
  
  static GlobalKey<NavigatorState>? navigatorkey = GlobalKey<NavigatorState>();

}

class LocalNotificationsService{
  final _localNotificationService = FlutterLocalNotificationsPlugin();

  final BehaviorSubject<String?> onNotificationClick = BehaviorSubject();

  Future<void> initialize() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings settings = InitializationSettings(
      android: androidInitializationSettings,
    );

    await _localNotificationService.initialize(
      settings, 
      onSelectNotification: onSelectNotification,
    );

  }

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'deslize_notifications_x', 
      'Deslize concluído',
      channelDescription: 'Este canal é para testes!',
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
      enableLights: true,
      playSound: true);

      const IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails(); 
      return NotificationDetails(
        android: androidNotificationDetails,
        iOS: iosNotificationDetails,
      );
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await _notificationDetails();
    await _localNotificationService.show(id,title,body,details);
  }

  Future<void> showNotificationWithPayLoad({
    required int id,
    required String title,
    required String body,
    required String payLoad,
  }) async {
    final details = await _notificationDetails();
    await _localNotificationService.show(id,title,body,details, payload: payLoad);
  }

  Future<void> showScheduleNotification({
    required int id,
    required String title,
    required String body,
    required int seconds,
  }) async {
    final details = await _notificationDetails();
    await _localNotificationService.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(DateTime.now().add(Duration(seconds: seconds)), tz.local),
      details,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  void onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payLoad){
      print('id $id');
    }
  
  void onSelectNotification(String? payLoad){
    print('payload $payLoad');

    if(payLoad != null && payLoad.isNotEmpty){
      onNotificationClick.add(payLoad);
    }
  }

}

/*class CustomNotification{
  final int id;
  final String? title;
  final String? body;
  final String? payLoad;

  CustomNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payLoad,
  });

}

class NotificationService{
  //APENAS PARA ANDROID
  late FlutterLocalNotificationsPlugin localNotificationsPlugin;
  late AndroidNotificationDetails androidDetails;

  NotificationService(){
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _setupNotification();
  }

  _setupNotification() async {
  
  await _setupTimezone();
  await _initializeNotifications();
}

Future<void> _setupTimezone() async {
  tz.initializeTimeZones();
  final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName!));
}

_initializeNotifications() async {
  const android = AndroidInitializationSettings('@mipmap/ic_launcher');
  //FAZER macOs, iOS, Linux ...
  await localNotificationsPlugin.initialize(
    const InitializationSettings(
      android: android,
    ),
    onSelectNotification: _onSelectNotification,
  );
 }
 _onSelectNotification(String? payLoad) {

    if(payLoad != null && payLoad.isNotEmpty){
      Navigator.of(AppRoutes.navigatorkey!.currentContext!).pushReplacementNamed(payLoad);
    }

  }
  showNotification(CustomNotification notification){
    androidDetails = const AndroidNotificationDetails(
      'deslize_notifications_x',
      'Deslize concluído',
      channelDescription: 'Este canal é para testes!',
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
      enableLights: true,
    );
    localNotificationsPlugin.show(
      notification.id, 
      notification.title,
      notification.body, 
      NotificationDetails(
        android: androidDetails,
      ),
      payload: notification.payLoad,
    );
  }
}*/