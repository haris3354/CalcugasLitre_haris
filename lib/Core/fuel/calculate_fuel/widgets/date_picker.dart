import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

Widget datePicker(DateRangePickerController rangePickerController,
        void Function(DateRangePickerSelectionChangedArgs)? selectionChanged) =>
    SizedBox(
      height: 230.h,
      width: double.infinity,
      child: SfDateRangePicker(
        todayHighlightColor: Colors.white,
        backgroundColor: Colors.black,
        controller: rangePickerController,
        initialSelectedDate: DateTime.now(),
        view: DateRangePickerView.month,
        monthViewSettings: const DateRangePickerMonthViewSettings(
          viewHeaderStyle: DateRangePickerViewHeaderStyle(
            textStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        onSelectionChanged: selectionChanged,
        headerHeight: 50,
        headerStyle: const DateRangePickerHeaderStyle(
          textAlign: TextAlign.center,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          //  backgroundColor: Colors.black,
        ),
        //  backgroundColor: Colors.black,
        rangeSelectionColor: Colors.white,
        startRangeSelectionColor: Colors.red,
        endRangeSelectionColor: Colors.red,
        selectionMode: DateRangePickerSelectionMode.range,
        monthCellStyle: DateRangePickerMonthCellStyle(
          todayTextStyle: const TextStyle(
            color: Colors.white,
          ),
          todayCellDecoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(color: const Color(0xFFF44436), width: 1),
            shape: BoxShape.circle,
          ),
          textStyle: const TextStyle(
            color: Colors.white,
          ),
          blackoutDatesDecoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(color: const Color(0xFFF44436), width: 1),
            shape: BoxShape.circle,
          ),
          specialDatesDecoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(color: const Color(0xFF2B732F), width: 1),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
