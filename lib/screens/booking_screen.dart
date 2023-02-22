import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../controllers/auth_api_controller.dart';
import '../models/city.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String _value = 'months';
  List<City> cities = <City>[];
  late Future<List<City>> _cityFuture;
  int? selectedCity;

  bool checkbox = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cityFuture = AuthApiController().getCities(context);
    print(_cityFuture);
  }

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
                  'احجز الان',
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
        padding:
            const EdgeInsets.only(left: 32, right: 32, top: 20, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'الية الحجز:',
                style: TextStyle(
                    fontFamily: 'NotoKufiArabic',
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        contentPadding: const EdgeInsets.all(0),
                        value: 'days',
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                        title: const Text(
                          'يومي',
                          style: TextStyle(
                              fontFamily: 'NotoKufiArabic',
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        contentPadding: const EdgeInsets.all(0),
                        value: 'months',
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                        title: const Text(
                          'شهري',
                          style: TextStyle(
                              fontFamily: 'NotoKufiArabic',
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        contentPadding: const EdgeInsets.all(0),
                        value: 'years',
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                        title: const Text(
                          'سنوي',
                          style: TextStyle(
                              fontFamily: 'NotoKufiArabic',
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'حدد اليوم المخصص:',
                      style: TextStyle(
                          fontFamily: 'NotoKufiArabic',
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/pick_date_screen');
                    },
                    child: Row(
                      children: const [
                        Text(
                          'عرض الجميع',
                          style: TextStyle(
                              fontFamily: 'NotoKufiArabic',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.black),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Text(
                'مدينة الانتقال:',
                style: TextStyle(
                    fontFamily: 'NotoKufiArabic',
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xffD9D9D9), width: 2.0),
                    borderRadius: BorderRadius.circular(8)),
                child: FutureBuilder<List<City>>(
                    future: _cityFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasData &&
                          snapshot.data!.isNotEmpty) {
                        cities=snapshot.data!;
                        return DropdownButton<int>(
                          // Initial Value
                          hint: Text(''),
                          isExpanded: true,
                          onTap: () {},
                          elevation: 4,
                          value: selectedCity,
                          underline: Container(
                            color: Colors.transparent,
                          ),
                          onChanged: (int? value) {
                            if (value != null) {
                              setState(() {
                                selectedCity = value;
                                print(selectedCity);
                              });
                            }
                          },
                          items: cities
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e.id,
                                  child: Text(e.name),
                                ),
                              )
                              .toList(),
                        );
                      }else{
                        return Center(child: Text(''),);
                      }
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'المنطقة:',
                style: TextStyle(
                    fontFamily: 'NotoKufiArabic',
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
              // Container(
              //   padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              //   decoration: BoxDecoration(
              //       border: Border.all(color: const Color(0xffD9D9D9), width: 2.0),
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
              //     hint: Text(_selectedCity),
              //     value: _selectedCity,
              //     items: _city.map(
              //       (e) {
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
              //           () {
              //             _selectedCity = value;
              //           },
              //         );
              //       }
              //     },
              //     elevation: 4,
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'اختار الباص المناسب:',
                style: TextStyle(
                    fontFamily: 'NotoKufiArabic',
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
              // Container(
              //   padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              //   decoration: BoxDecoration(
              //       border: Border.all(color: const Color(0xffD9D9D9), width: 2.0),
              //       borderRadius: BorderRadius.circular(8)),
              //   child: DropdownButton<String>(
              //     borderRadius: BorderRadius.circular(8),
              //     style: const TextStyle(
              //         fontFamily: 'NotoKufiArabic',
              //         fontWeight: FontWeight.w400,
              //         fontSize: 18,
              //         color: Color(0xff121212)),
              //     underline: Container(
              //       color: Colors.transparent,
              //     ),
              //     hint: Text(_selectedCity),
              //     value: _selectedCity,
              //     items: _city.map(
              //       (e) {
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
              //           () {
              //             _selectedCity = value;
              //           },
              //         );
              //       }
              //     },
              //     elevation: 4,
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 204,
                padding:
                    const EdgeInsets.only(top: 10, left: 16.0, right: 16.0),
                decoration: BoxDecoration(
                    color: const Color(0xffFBFBFB),
                    border:
                        Border.all(color: const Color(0xffD9D9D9), width: 2.0),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: const [
                          Text(
                            'اسم السائق:',
                            style: TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: const [
                          Text(
                            'خط سير الباص:',
                            style: TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'عدد المقاعد المراد حجزها:',
                style: TextStyle(
                    fontFamily: 'NotoKufiArabic',
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                  const Text(
                    '3',
                    style: TextStyle(
                        fontFamily: 'NotoKufiArabic',
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.minimize))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {
                      setState(() {
                        checkbox = value!;
                      });
                    },
                  ),
                  const Text(
                    'لقد قرأت جميع',
                    style: TextStyle(
                        fontFamily: 'NotoKufiArabic',
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'الشروط والأحكام',
                      style: TextStyle(
                        fontFamily: 'NotoKufiArabic',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const Text(
                    'الخاصة بالخدمة.',
                    style: TextStyle(
                        fontFamily: 'NotoKufiArabic',
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {},
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 52),
                    backgroundColor: const Color(0xffF7D140)),
                child: const Text(
                  'احجز الان',
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
        ),
      ),
    );
  }
}
