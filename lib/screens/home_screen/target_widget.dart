import 'package:flutter/material.dart';
import 'package:moneymanager/screens/home_screen/add_target.dart';
import 'package:moneymanager/theme/theme_constants.dart';

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
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 141, 141, 141),
                blurRadius: 4,
                offset: Offset(0, 1),
                blurStyle: BlurStyle.normal,
              )
            ],
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: containerColor,
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DATE 01/09/2023',
                    style: _textTheme.labelSmall,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                      width: 200,
                      child: Text('Target', style: _textTheme.titleLarge)),
                ],
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromARGB(138, 200, 230, 201),
                ),
                margin: const EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '10',
                      style: _textTheme.bodyLarge,
                    ),
                    Text(
                      'JAN',
                      style: _textTheme.bodyLarge,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
