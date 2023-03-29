import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  String _range = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
          ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        children: [
          Row(
            children: const [
              Spacer(),
              Text(
                'Pick rent duration',
                style: TextStyle(
                  color: kBackgroundEndColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Stack(alignment: Alignment.center, children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(0.05),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.31,
                child: Container(
                  decoration: BoxDecoration(
                    color: kContainerEndColor.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(0.1),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.31,
                child: Container(
                  decoration: BoxDecoration(
                    color: kContainerEndColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Container(
                decoration: BoxDecoration(
                  color: kContainerEndColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SfDateRangePicker(
                    selectionColor: kContainerStartColor,
                    startRangeSelectionColor: kContainerEndColor,
                    endRangeSelectionColor: kContainerStartColor,
                    todayHighlightColor: kContainerStartColor,
                    rangeSelectionColor: kContainerStartColor.withOpacity(0.5),
                    enablePastDates: false,
                    confirmText: 'Confirm',
                    cancelText: 'Cancel',
                    backgroundColor: kContainerMiddleColor.withOpacity(0.3),
                    onSelectionChanged: _onSelectionChanged,
                    selectionMode: DateRangePickerSelectionMode.range,
                    initialSelectedRange: PickerDateRange(DateTime.now(),
                        DateTime.now().add(const Duration(days: 30))),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
      Text(
        'Selected range: $_range',
        softWrap: true,
        style: const TextStyle(
          color: kBackgroundEndColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);
  }
}
