import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneymanager/db/function/transaction/transaction_db.dart';
import 'package:moneymanager/screens/graph/graph_model/graph_model.dart';
import 'package:moneymanager/theme/theme_constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TransactionDb().graphSum();
    return PageView(
      children: [
        graph('Day', context),
      ],
    );
  }
}

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}

Widget graph(String name, BuildContext context) {
  var size = MediaQuery.of(context).size;
  TextTheme _textTheme = Theme.of(context).textTheme;
  return Scaffold(
    body: SfCircularChart(
      title: ChartTitle(
        borderColor: Colors.black,
        text: 'Income & Expences',
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 21,
          fontWeight: FontWeight.bold
        ),
      ),
      series: <CircularSeries>[
        PieSeries<GraphModel, String>(
          pointColorMapper: (datum, index) {
            return index == 0 ? incomeColor : expenseColor;
          },
          dataSource: TransactionDb().graphDataListene.value,
          xValueMapper: (GraphModel datum, index) {
            return datum.name;
          },
          yValueMapper: (GraphModel data, index) {
            return data.sum;
          },
          dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              borderColor: Color.fromARGB(255, 2, 42, 42),
              textStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        ),
      ],
      legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          alignment: ChartAlignment.near),
    ),
    // body: SfCartesianChart(
    // primaryXAxis: CategoryAxis(
    //     majorGridLines: const MajorGridLines(
    //       width: 0,
    //     ),
    //     title: AxisTitle(
    //         text: name,
    //         textStyle: const TextStyle(
    //           color: Colors.white,
    //         ))),
    // primaryYAxis: NumericAxis(
    //     majorGridLines: const MajorGridLines(
    //       width: 0,
    //     ),
    //     title: AxisTitle(
    //         text: 'Amount',
    //         textStyle: const TextStyle(
    //           color: Colors.white,
    //         ))),
    // backgroundColor: Colors.black,
    // series: <ChartSeries>[
    //   LineSeries<TransactionModel, double>(
    //     color: incomeColor,
    //     dataSource: TransactionDb().expenceTransactionListener.value,
    //     xValueMapper: (TransactionModel datum, index) {
    //       return  datum.amount;
    //     },
    //     yValueMapper: (TransactionModel datum, index) {
    //       return index;
    //     },
    //   ),
    //   LineSeries<TransactionModel, double>(
    //     color: expenseColor,
    //     dataSource: TransactionDb().allTransactionListener.value,
    //     xValueMapper: (TransactionModel datum, index) {
    //       return datum.amount;
    //     },
    //     yValueMapper: (TransactionModel datum, index) {
    //       return index;
    //     },
    //   )
    // ]),
    floatingActionButton: FloatingActionButton(
      backgroundColor: const Color.fromARGB(163, 66, 65, 65),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (ctx) {
              return SizedBox(
                height: size.height / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Start : ',
                          style: _textTheme.titleLarge,
                        ),
                        const DateSort(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'End : ',
                          style: _textTheme.titleLarge,
                        ),
                        const DateSort(),
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
              );
            });
      },
      child: const FaIcon(FontAwesomeIcons.sort),
    ),
  );
}

class DateSort extends StatefulWidget {
  const DateSort({super.key});

  @override
  State<DateSort> createState() => _DateState();
}

class _DateState extends State<DateSort> {
  DateTime? _dateTime;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        _dateTime = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now());
        setState(() {});
      },
      icon: const Icon(Icons.calendar_month_outlined),
      label: _dateTime == null
          ? const Text('select')
          : Text(
              '${_dateTime?.day} - ${_dateTime?.month} - ${_dateTime?.year}',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
    );
  }
}
