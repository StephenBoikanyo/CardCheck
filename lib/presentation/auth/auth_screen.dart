import 'package:flutter/material.dart';
import 'package:card_check/presentation/widgets/widgets.dart';


class AuthScreen extends StatelessWidget {
  static const String id = 'AuthScreen';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16),
        child: Column(
          children: [
            SizedBox(height: 100,),
            Container(
              child:  Expanded(child: AuthTabs()),
            )

          ],

        ),
      ),


    );
  }
}
