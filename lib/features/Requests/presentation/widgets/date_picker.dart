import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/flutter_timeline_calendar.dart';

class DateSelectorListTile extends StatefulWidget {
  const DateSelectorListTile({Key? key}) : super(key: key);

  @override
  _DateSelectorListTileState createState() => _DateSelectorListTileState();
}

class _DateSelectorListTileState extends State<DateSelectorListTile> {
  DateTime _selectedDate = DateTime.now(); 

  void _showCalendarPicker(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TimelineCalendar(
              calendarType: CalendarType.GREGORIAN,
              calendarLanguage: 'en',
              calendarOptions: CalendarOptions(
                viewType: ViewType.DAILY,
                toggleViewType: true,
                headerMonthElevation: 0,
                headerMonthBackColor: Colors.transparent,
              ),
              dayOptions: DayOptions(
                compactMode: true,
                weekDaySelectedColor: Colors.green,
                selectedBackgroundColor: Colors.green,
                disableDaysBeforeNow: true,
              ),
              headerOptions: HeaderOptions(
                weekDayStringType: WeekDayStringTypes.SHORT,
                monthStringType: MonthStringTypes.FULL,
                backgroundColor: Colors.green,
                headerTextColor: Colors.black,
              ),
              dateTime: CalendarDateTime(
                year: _selectedDate.year,
                month: _selectedDate.month,
                day: _selectedDate.day,
              ),
              onChangeDateTime: (calendarDateTime) {
              
                setState(() {
                  _selectedDate = calendarDateTime.toDateTime();
                });
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Select Date"),
      subtitle: Text(
        "Selected Date: ${_selectedDate.toLocal().toString().split(' ')[0]}",
        style: TextStyle(color: Colors.black54),
      ),
      trailing: IconButton(
        icon: Icon(Icons.calendar_today),
        onPressed: () => _showCalendarPicker(context),
      ),
    );
  }
}
