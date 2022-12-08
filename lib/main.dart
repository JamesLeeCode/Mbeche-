import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_ui_kit/provider/charity_provider.dart';
import 'package:wallet_ui_kit/provider/gift_provider.dart';
import 'package:wallet_ui_kit/provider/goals_provider.dart';
import 'package:wallet_ui_kit/provider/organization_provider.dart';
import 'package:wallet_ui_kit/provider/promo_provider.dart';
import 'package:wallet_ui_kit/provider/step_provider.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/view/screens/splash_screen.dart';
import 'di_container.dart' as di;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
final navigatorKey = GlobalKey<NavigatorState>();


FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<CharityProvider>()),
      ChangeNotifierProvider(
          create: (context) => di.sl<OrganizationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<GiftProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<GoalsProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<StepProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<PromoProvider>()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MBECHE',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorResources.COLOR_WHITE,
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
      ),
      home: SplashScreenWallet(),
    );
  }
}

Future<void> showNotificationMediaStyle() async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'media channel id',
    'media channel name',
    'media channel description',
    color: Colors.red,
    enableLights: true,
    largeIcon: DrawableResourceAndroidBitmap("flutter_devs"),
    styleInformation: MediaStyleInformation(),
  );
  var platformChannelSpecifics =
      NotificationDetails(androidPlatformChannelSpecifics, null);
  await flutterLocalNotificationsPlugin.show(
      0, 'notification title', 'notification body', platformChannelSpecifics);
}

Future<void> showBigPictureNotification() async {
  var bigPictureStyleInformation = BigPictureStyleInformation(
      DrawableResourceAndroidBitmap("flutter_devs"),
      largeIcon: DrawableResourceAndroidBitmap("flutter_devs"),
      contentTitle: 'flutter devs',
      htmlFormatContentTitle: true,
      summaryText: 'summaryText',
      htmlFormatSummaryText: true);
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'big text channel id',
      'big text channel name',
      'big text channel description',
      styleInformation: bigPictureStyleInformation);
  var platformChannelSpecifics =
      NotificationDetails(androidPlatformChannelSpecifics, null);
  await flutterLocalNotificationsPlugin.show(
      0, 'big text title', 'silent body', platformChannelSpecifics,
      payload: "big image notifications");
}

Future<void> scheduleNotification() async {
  var scheduledNotificationDateTime = DateTime.now().add(Duration(seconds: 5));
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'channel id',
    'channel name',
    'channel description',
    icon: 'flutter_devs',
    largeIcon: DrawableResourceAndroidBitmap('flutter_devs'),
  );
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.schedule(
      0,
      'scheduled title',
      'scheduled body',
      scheduledNotificationDateTime,
      platformChannelSpecifics);
}

Future<void> cancelNotification() async {
  await flutterLocalNotificationsPlugin.cancel(0);
}
