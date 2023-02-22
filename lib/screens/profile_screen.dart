import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(150.0),
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 104,
                    height: 104,
                  ),
                  const Text(
                    'الملف الشخصي',
                    style: TextStyle(
                        fontFamily: 'NotoKufiArabi',
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
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 32, right: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
              const CircleAvatar(
                radius: 55,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
              const SizedBox(height: 10,),
              const Text(
                'اسماعيل يوسف خلة',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'NotoKufiArabi',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Color(0xff121212)),
              ),
              const SizedBox(height: 10,),
              const Text(
                'رقم الهاتف',
                style: TextStyle(
                    fontFamily: 'NotoKufiArabi',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Color(0xff121212)),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                    const BorderSide(color: Colors.red, width: 1),
                  ),
                  labelStyle: const TextStyle(
                    locale: Locale('ar'),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabled: true,
                  suffixIcon: const Icon(Icons.edit_note_rounded),
                  hintText: '970-595-435-504+',
                  fillColor: const Color(0xff8E8E92),
                ),
              ),
              const SizedBox(height: 10,),
              const Text(
                'رقم الهوية:',
                style: TextStyle(
                    fontFamily: 'NotoKufiArabi',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Color(0xff121212)),
              ),
              const Text(
                '4 0610598 1',
                style: TextStyle(
                    fontFamily: 'NotoKufiArabi',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Color(0xff8E8E92)),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () async {},
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 52),
                    backgroundColor: const Color(0xffF7D140)),
                child: const Text(
                  'احصل على رمز الـ QR الخاص بك',
                  style: TextStyle(
                    fontFamily: 'NotoKufiArabic',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xff121212),
                  ),
                ),
              ),

            ],
          ),
        ));
  }
}
