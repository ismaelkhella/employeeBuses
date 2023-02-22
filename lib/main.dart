import 'package:employe_buses/screens/booking_screen.dart';
import 'package:employe_buses/screens/drawer_bn_screen.dart';
import 'package:employe_buses/screens/home_screen.dart';
import 'package:employe_buses/screens/launch_screen.dart';
import 'package:employe_buses/screens/login_screen.dart';
import 'package:employe_buses/screens/pick_date_screen.dart';
import 'package:employe_buses/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('ar'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen':(context)=>LaunchScreen(),
        '/login_screen':(context)=>LoginScreen(),
        '/drawer_bn_screen':(context)=>DrawerBnScreen(),
        '/home_screen':(context)=>HomeScreen(),
        '/booking_screen':(context)=>BookingScreen(),
        '/pick_date_screen':(context)=>PickDateScreen(),
        '/profile_screen':(context)=>ProfileScreen(),
      },
    );
  }
}
