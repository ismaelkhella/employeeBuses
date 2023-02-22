import 'package:employe_buses/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../models/bn_items.dart';
import 'booking_screen.dart';

class DrawerBnScreen extends StatefulWidget {
  const DrawerBnScreen({Key? key}) : super(key: key);

  @override
  State<DrawerBnScreen> createState() => _DrawerBnScreenState();
}

class _DrawerBnScreenState extends State<DrawerBnScreen> {
  final int _currentIndex = 0;

  final List<BnItem> _bnItems = <BnItem>[
    BnItem(title: 'الخدمات الرئيسية', widget: const HomeScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(150.0),
          child: Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 104,
                  height: 104,
                ),
                Text(
                  _bnItems[_currentIndex].title,
                  style: const TextStyle(
                      fontFamily: 'NotoKufiArabic',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xff121212)),
                ),
              ],
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffF7D140),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(children: [
          Container(
            height: 175,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color(0xffF7D140),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5))),
            child: Center(
              child: Image.asset('assets/images/logo.png',width: 124,height: 124,),
            ),
          ),
          ListTile(
            leading:  Icon(Icons.home, color: _currentIndex==0? Color(0xffF7D140):Colors.black),
            title:  Text('الخدمات الرئيسية',style: TextStyle(
              fontSize: 14,
              fontFamily: 'NotoKufiArabic',
              fontWeight: FontWeight.w400,
                color: _currentIndex==0? Color(0xffF7D140):Colors.black
            ),),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/home_screen');
            },
          ),
          ListTile(
            leading:  Icon(Icons.directions_bus_filled_sharp, color: _currentIndex==1? Color(0xffF7D140):Colors.black),
            title:  Text('احجز الباص',style: TextStyle(
              fontSize: 14,
              fontFamily: 'NotoKufiArabic',
              fontWeight: FontWeight.w400,
                color: _currentIndex==1? Color(0xffF7D140):Colors.black
            ),),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/booking_screen');
            },
          ),
          ListTile(
            leading:  Icon(Icons.text_snippet, color: _currentIndex==2? Color(0xffF7D140):Colors.black),
            title:  Text('الخدمات المتوفرة في التطبيق',style: TextStyle(
              fontSize: 14,
              fontFamily: 'NotoKufiArabic',
              fontWeight: FontWeight.w400,
              color: _currentIndex==2? Color(0xffF7D140):Colors.black,
            ),),
            onTap: () {
              // Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading:  Icon(Icons.info, color: _currentIndex==3? Color(0xffF7D140):Colors.black),
            title:  Text('عن التطبيق',style: TextStyle(
              fontSize: 14,
              fontFamily: 'NotoKufiArabic',
              fontWeight: FontWeight.w400,
              color: _currentIndex==3? Color(0xffF7D140):Colors.black,
            ),),
            onTap: () {
              // Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading:  Icon(Icons.calendar_today, color: _currentIndex==4? Color(0xffF7D140):Colors.black),
            title:  Text('التقرير الشهري',style: TextStyle(
              fontSize: 14,
              fontFamily: 'NotoKufiArabic',
              fontWeight: FontWeight.w400,
              color: _currentIndex==4? Color(0xffF7D140):Colors.black,
            ),),
            onTap: () {
              // Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading:  Icon(Icons.person, color: _currentIndex==5? Color(0xffF7D140):Colors.black),
            title:  Text('الملف الشخصي',style: TextStyle(
              fontSize: 14,
              fontFamily: 'NotoKufiArabic',
              fontWeight: FontWeight.w400,
              color: _currentIndex==5? Color(0xffF7D140):Colors.black,
            ),),
            onTap: () {
              Navigator.pushNamed(context, '/profile_screen');
            },
          ),
          ListTile(
              leading:  const Icon(Icons.logout, color: Colors.black),
              title: const Text('تسجيل الخروج',style: TextStyle(
                fontSize: 14,
                fontFamily: 'NotoKufiArabic',
                fontWeight: FontWeight.w400,)),
              onTap: () async {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login_screen', (route) => false);
              }),
        ]),
      ),
      body: _bnItems[_currentIndex].widget,
    );
  }
}
