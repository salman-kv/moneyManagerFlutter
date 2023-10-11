import 'package:flutter/material.dart';
import 'package:moneymanager/screens/account_screen/edit_profile.dart';
import 'package:moneymanager/screens/all_transaction/deleted_screen.dart';
import 'package:moneymanager/screens/privacy_policy/privacy_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'SALMAN K V',
                        style: _textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                      return const EditProfile();
                    }));
                  }, icon: const Icon(Icons.edit)),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    TextButton.icon(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                        return DeletedScreen();
                      }));
                    }, icon: Icon(Icons.delete), label: Text('Cleare All'))
                  ],
                ),
                // Row(
                //   children: [
                //     Text(
                //       'Logout : ',
                //       style: _textTheme.titleMedium,
                //     ),
                //     IconButton(
                //         onPressed: () {
                //           // alerting(context, 'log out');
                //         },
                //         icon: const Icon(
                //           Icons.logout_outlined,
                //         )),
                //   ],
                // ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return const PrivacyScreen();
                }));
              },
              child: Text(
                'Privacy Policy',
                textAlign: TextAlign.center,
                style: _textTheme.titleMedium?.copyWith(
                    color: Colors.red, decoration: TextDecoration.underline),
              ),
            )
          ],
        )
      ],
    );
  }
}
