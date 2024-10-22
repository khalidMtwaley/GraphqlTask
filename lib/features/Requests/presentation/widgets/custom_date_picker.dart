
import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:task/core/theme/colors_manager.dart';

class CustomCalendarDatePicker extends StatefulWidget {
  final Function(DateTime?)? onDateSelected; 

  const CustomCalendarDatePicker({Key? key, this.onDateSelected}) : super(key: key);

  @override
  _CustomCalendarDatePickerState createState() => _CustomCalendarDatePickerState();
}

class _CustomCalendarDatePickerState extends State<CustomCalendarDatePicker> {
  List<DateTime?> _selectedDates = [DateTime.now()]; 

  @override
  void initState() {
    super.initState();
    if (widget.onDateSelected != null) {
      widget.onDateSelected!(_selectedDates.first);
    }
  }

  void _showCalendarDialog() async {
    final config = CalendarDatePicker2WithActionButtonsConfig(
      calendarType: CalendarDatePicker2Type.single,
      selectedDayHighlightColor: ColorsManager.purble,
      firstDayOfWeek: 1,
      weekdayLabelTextStyle: const TextStyle(
        color: ColorsManager.grey,
        fontWeight: FontWeight.bold,
      ),
    );

    final List<DateTime?>? pickedDates = await showCalendarDatePicker2Dialog(
      context: context,
      config: config,
      dialogSize: const Size(325, 370),
      value: _selectedDates,
    );

    if (pickedDates != null && pickedDates.isNotEmpty) {
      setState(() {
        _selectedDates = pickedDates;
      });
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(pickedDates.first);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.darkGrey,
      child: ListTile(
        title: Text('Select Date', style: TextStyle(color: ColorsManager.grey)),
        subtitle: Text(
          _selectedDates.isNotEmpty && _selectedDates[0] != null
              ? _selectedDates[0]!.toLocal().toString().split(' ')[0]
              : 'No date selected',
          style: TextStyle(
            color: ColorsManager.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(
          Icons.calendar_today,
          color: ColorsManager.grey,
        ),
        onTap: _showCalendarDialog,
      ),
    );
  }
}
