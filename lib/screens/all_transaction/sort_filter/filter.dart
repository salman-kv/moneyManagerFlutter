import 'package:flutter/material.dart';
import 'package:moneymanager/db/function/catogory/catogory_db.dart';
import 'package:moneymanager/db/function/transaction/transaction_db.dart';

class TransactionFilter extends StatefulWidget {
  TransactionFilter({super.key});

  @override
  State<TransactionFilter> createState() => _TransactionFilterState();
}

class _TransactionFilterState extends State<TransactionFilter> {
DateTime? startDate;
DateTime endDate=DateTime.now();
@override
  void initState() {
    startDate=TransactionDb().startDateFilter;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Filter By : ',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
              'Select Date : ',
              style: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.w500,
              ),
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Text(
                  'Start Date: ',
                  style: TextStyle(fontSize: 15),
                ),
                TextButton.icon(
                  onPressed: () async {
                   startDate=await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: TransactionDb().startDateFilter!,
                        lastDate: DateTime.now());
                        setState(() {
                          
                        });

                  },
                  icon: const Icon(Icons.date_range),
                  label: Text('${startDate!.year} - ${startDate!.month} - ${startDate!.day}',style: TextStyle(
                    color: Color.fromARGB(255, 32, 69, 99),
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'End Date : ',
                  style: TextStyle(fontSize: 15),
                ),
                TextButton.icon(
                  onPressed: () async {
                   endDate=(await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: startDate!,
                        lastDate: DateTime.now()))!;
                        setState(() {
                          
                        });

                  },
                  icon: const Icon(Icons.date_range),
                  label: Text('${endDate.year} - ${endDate.month} - ${endDate.day}',style: TextStyle(
                    color: Color.fromARGB(255, 32, 69, 99),
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ],
            ),
           
          ],
        ),
         const Text(
              'Select catogory : ',
              style: TextStyle(fontSize: 16),
            ),
        Expanded(
            child: SingleChildScrollView(
          child: ValueListenableBuilder(
            valueListenable: CatogoryDb().toatalCatogoryListener,
            builder: (context, value, child) {
              return Wrap(
                // crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                runSpacing: 5,
                spacing: 5,
                children: List.generate(value.length, (index) {
                  return ChoiceChip(
                      label: Text(value[index].name), selected: true);
                }),
              );
            },
          ),
        )),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {},
              icon:const  Icon(Icons.filter_list),
              label: const Text('Filter')),
        )
      ],
    );
  }
}
