import 'package:flutter/material.dart';

import '../models/city.dart';

class CallUsScreen extends StatefulWidget {
  const CallUsScreen({Key? key}) : super(key: key);

  @override
  State<CallUsScreen> createState() => _CallUsScreenState();
}

class _CallUsScreenState extends State<CallUsScreen> {

 String _selectedCity='شكوى';
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
                  'تواصل معنا',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'نوع الطلب:',
            style: TextStyle(
                fontFamily: 'NotoKufiArabi',
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color(0xff121212)),
          ),
          // Container(
          //   padding: EdgeInsets.only(left: 16.0, right: 16.0),
          //   decoration: BoxDecoration(
          //       border: Border.all(color: Color(0xffD9D9D9), width: 2.0),
          //       borderRadius: BorderRadius.circular(8)),
          //   child: DropdownButton<String>(
          //     borderRadius: BorderRadius.circular(8),
          //     style: const TextStyle(
          //         color: Colors.black,
          //         fontSize: 20,
          //         fontWeight: FontWeight.w500,
          //         fontFamily: 'Tajawal'),
          //     underline: Container(
          //       color: Colors.transparent,
          //     ),
          //     hint: Text('شكوى'),
          //     value: 'شكوى',
          //     items: _city.map(
          //           (e) {
          //         return DropdownMenuItem(
          //           value: e.name,
          //           child: Text(e.name),
          //         );
          //       },
          //     ).toList(),
          //     isExpanded: true,
          //     onTap: () {},
          //     onChanged: (String? value) {
          //       if (value != null) {
          //         setState(
          //               () {
          //             _selectedCity = value;
          //           },
          //         );
          //       }
          //     },
          //     elevation: 4,
          //   ),
          // ),
          const Text(
            'نوع الطلب:',
            style: TextStyle(
                fontFamily: 'NotoKufiArabi',
                fontWeight: FontWeight.w700,
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
              hintText: 'ازدحام السكان....',
              fillColor: const Color(0xff8E8E92),
            ),
          ),
          Text(
            'بيانات التواصل:',
            style: TextStyle(
                fontFamily: 'NotoKufiArabi',
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color(0xff121212)),
          ),

        ],
      ),
    );
  }
}

