import 'package:flutter/material.dart';
import 'package:moneymanager/screens/privacy_policy/privacy_screen.dart';
import 'package:moneymanager/screens/privacy_policy/terms&condition.dart';
import 'package:url_launcher/url_launcher.dart';
final Uri _url=Uri.parse('https://www.google.com/search?q=google&oq=google&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIGCAEQRRg7MgYIAhBFGDwyBggDEEUYPDIGCAQQRRg8MgYIBRBFGEEyBggGEEUYQTIGCAcQRRhB0gEINDMxM2owajGoAgCwAgA&sourceid=chrome&ie=UTF-8&bshm=rime/1');
class DrawerPage extends StatelessWidget {
  final TextTheme texTheme;
  const DrawerPage({required this.texTheme, super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme=Theme.of(context).textTheme;
    return Drawer(
      // backgroundColor: Colors.white,
      width: 350,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            // const Text(
            //   'MENU',
            //   style: TextStyle(
            //     fontFamily: 'irish',
            //     fontSize: 25,
            //   ),
            // ),
            Center(
              child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100)),
                    ),
            ),
            Center(
              child: Text(
                      'SALMAN K V',
                      style: _textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            // const Divider(
            //   thickness: 2,
            //   color: Colors.black,
            // ),
            TextButton(
              onPressed: () {
               launchUrl(_url);
                // Navigator.of(context).pop();
                Scaffold.of(context).closeDrawer();
              },
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'About us',
                  style: texTheme.titleLarge
                      ?.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            // const Divider(
            //   thickness: 1,
            //   color: Colors.black,
            // ),
            // TextButton(
            //   onPressed: () {
                
            //     Navigator.of(context).pop();
            //     // Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
            //     //   return al
            //     // }));
            //   },
              
            //   child: SizedBox(
            //     width: double.infinity,
            //     child: Text(
            //       'All Transaction',
            //       style: texTheme.titleLarge
            //           ?.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
            //     ),
            //   ),
            // ),
            TextButton(
              onPressed: () {
                
                // Navigator.of(context).pop();
                Scaffold.of(context).closeDrawer();
              },
              
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Faq',
                  style: texTheme.titleLarge
                      ?.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return PrivacyScreen();
                }));
                // Navigator.of(context).pop();
                Scaffold.of(context).closeDrawer();
              },
              
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Privacy policy',
                  style: texTheme.titleLarge
                      ?.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return const TermsAndCondition();
                }));
                // Navigator.of(context).pop();
                Scaffold.of(context).closeDrawer();
              },
              
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Terms & Condition',
                  style: texTheme.titleLarge
                      ?.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            // const Divider(
            //   thickness: 1,
            //   color: Colors.black,
            // ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            //       return const DeletedScreen();
            //     }));
            //     // Navigator.of(context).pop();
            //     Scaffold.of(context).closeDrawer();
            //   },
            //   child: SizedBox(
            //     width: double.infinity,
            //     child: Text(
            //       'Deleted Transaction',
            //       style: texTheme.titleLarge
            //           ?.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
