import 'package:employe_buses/screens/booking_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> bnLabels = [
      'حجز مقعد ',
      'تواصل معنا',
      'حجوزاتي',
      'النقابة',
    ];
    const List<String> bnIcons = [
      'assets/images/chair.png',
      'assets/images/people.png',
      'assets/images/booking.png',
      'assets/images/hierarchy.png',
    ];

    List<String> path = [
      '/'
    ];
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        height: double.infinity,
        child: ListView(shrinkWrap: true, children: [
          Column(
            children: [
              SizedBox(
                height: 370,
                width: 370,
                child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 10 / 10),
                    itemBuilder: (context, index) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF8F8F8),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          if (index == 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const BookingScreen()));
                          } else {
                            Navigator.pushNamed(context, path[index]);
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(bnIcons[index].toString()),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              bnLabels[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontFamily: 'NotoKufiArabic',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        //label text
                      );
                    }),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'نقابة الموظفين في \nالقطاع العام',
                textAlign: TextAlign.center,
                style:  TextStyle(
                    fontFamily: 'NotoKufiArabic',
                    fontWeight: FontWeight.w400,
                    color: Color(0xff8E8E92),
                    fontSize: 15),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
