import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PickDateScreen extends StatefulWidget {
  const PickDateScreen({Key? key}) : super(key: key);

  @override
  State<PickDateScreen> createState() => _PickDateScreenState();
}

class _PickDateScreenState extends State<PickDateScreen> {
  DateRangePickerController _datePickerController = DateRangePickerController();

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
      body: SfDateRangePicker(
        view: DateRangePickerView.month,
        monthViewSettings:
        DateRangePickerMonthViewSettings(firstDayOfWeek: 6),
        selectionMode: DateRangePickerSelectionMode.multiple,
        // onSelectionChanged: _onSelectionChanged,
        showActionButtons: true,
        controller: _datePickerController,
        onSubmit: (Object? val) {
          print(val);
        },
        onCancel: () {
          _datePickerController.selectedRanges = null;
        },
      ),
    );
  }
}
// void _onSelectionChanged(
//     DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
//   print(dateRangePickerSelectionChangedArgs.value);
// }