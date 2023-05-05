import 'package:diskspacerenting/Constants/Constant%20Variables/constants.dart';
import 'package:diskspacerenting/Constants/Responsive/responsiveWidget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  String range;
  DatePicker({required this.range, super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      widget.range =
          '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
          ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Stack(alignment: Alignment.center, children: [
          SizedBox(
            height: ResponsiveWidget.isSmallScreen(context)
                ? MediaQuery.of(context).size.height * 0.3
                : MediaQuery.of(context).size.height * 0.35,
            width: ResponsiveWidget.isSmallScreen(context)
                ? double.infinity
                : MediaQuery.of(context).size.width * 0.4,
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
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Text(
          'Selected range: ${widget.range}',
          softWrap: true,
          style: const TextStyle(
            color: kBackgroundEndColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
