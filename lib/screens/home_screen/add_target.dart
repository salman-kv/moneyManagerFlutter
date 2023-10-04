import 'package:flutter/material.dart';
import 'package:moneymanager/screens/app_bar/all_appbar.dart';
import 'package:moneymanager/theme/theme_constants.dart';

class AddTarget extends StatefulWidget {
  const AddTarget({super.key});

  @override
  State<AddTarget> createState() => _AddTargetState();
}

class _AddTargetState extends State<AddTarget> {
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      appBar: const AllAppbar(
        headname: 'TARGET',
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        label: Text('Target'),
                        labelStyle:
                            TextStyle(color: Color.fromARGB(112, 0, 0, 0)),
                        filled: true,
                        border: InputBorder.none),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Starting Date : ',
                      style: _textTheme.titleMedium,
                    ),
                    TextButton.icon(
                      onPressed: () async {
                        _startDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate:DateTime(3000));
                        setState(() {});
                      },
                      icon: const Icon(Icons.calendar_month_outlined),
                      label: _startDate == null
                          ? const Text('select starting date')
                          : Text(
                              '${_startDate?.day} - ${_startDate?.month} - ${_startDate?.year}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ending Date : ',
                      style: _textTheme.titleMedium,
                    ),
                    TextButton.icon(
                      onPressed: () async {
                        _endDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(300));
                        // print(s);
                        // DateUtils.dateOnly(_dateTime);
                        setState(() {});
                      },
                      icon: const Icon(Icons.calendar_month_outlined),
                      label: _endDate == null
                          ? const Text('select ending date')
                          : Text(
                              '${_endDate?.day} - ${_endDate?.month} - ${_endDate?.year}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          backgroundColor: incomeColor),
                      child: const Text('ADD')),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
