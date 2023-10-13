import 'package:flutter/material.dart';
import 'package:moneymanager/screens/home_screen/add_target.dart';

class TargetWidget extends StatelessWidget {
  const TargetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return const AddTarget();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(215, 0, 0, 0),
            //     gradient: LinearGradient(colors: [

            // Color.fromARGB(158, 11, 219, 11),
            // Color.fromARGB(225, 254, 255, 255),

            //     ]),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 141, 141, 141),
                blurRadius: 4,
                offset: Offset(0, 1),
                blurStyle: BlurStyle.normal,
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.all(8),
          child: ValueListenableBuilder(
            valueListenable: targetModelListener,
            builder: (context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      value.target,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
               value.target=='Add Target' ? Text('') :   Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Start In : ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 166, 169, 175),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            ' ${value.startTime.day} - ${value.startTime.month} - ${value.startTime.year}',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 166, 169, 175),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // const Text(' To ',style: TextStyle(
                      //   color: Color.fromARGB(255, 11, 11, 11)
                      // ),),

                      Row(
                        children: [
                          const Text(
                            'Achieve On  :  ',
                            style:TextStyle(
                                color: Color.fromARGB(255, 3, 172, 6),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            '${value.endTime.day} - ${value.endTime.month} - ${value.endTime.year}',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 3, 172, 6),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
