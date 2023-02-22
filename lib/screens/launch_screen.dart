import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Color(0xffF9D95F), Color(0xffF7D140)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 260,
              height: 260,
            ),
            const Text(
              'نقابة الموظفين في',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'NotoKufiArabic',
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const Text(
              'القطاع العام',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'NotoKufiArabic',
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
