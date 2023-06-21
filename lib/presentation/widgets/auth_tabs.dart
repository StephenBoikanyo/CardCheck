import 'package:card_check/presentation/home/home.dart';
import 'package:card_check/presentation/widgets/rounded_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:card_check/presentation/utils/constants.dart';
import 'custom_textfield.dart';

class AuthTabs extends StatefulWidget {
  @override
  _AuthTabsState createState() => _AuthTabsState();
}

class _AuthTabsState extends State<AuthTabs> with SingleTickerProviderStateMixin {
 late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          indicatorWeight: 3,
          tabs: [
            Tab(
              child: Text(
                'Login',
                style: largeText.copyWith(color: _tabController.index == 0 ? Colors.black : Colors.grey,)
              ),
            ),
            Tab(
              child: Text(
                'Signup',
                style: largeText.copyWith(color: _tabController.index == 0 ? Colors.black : Colors.grey,)
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children:  [
              // Login Tab Content
             Column(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 const SizedBox(height: 100,),
                // CustomTextField(fieldLabel: 'Email'),
                 const SizedBox( height: 20,),
                  //CustomTextField(fieldLabel: 'Password')
          ],
             ),
              // Signup Tab Content
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 100,),
                 // CustomTextField(fieldLabel: 'Name'),
                  const SizedBox( height: 20,),
                 // CustomTextField(fieldLabel: 'Email'),
                  const SizedBox(height: 20,),
                  //CustomTextField(fieldLabel: 'Password'),
                  const SizedBox(height: 20,),
                  // CustomTextField(fieldLabel: 'Confirm Email'),
                  const SizedBox(height: 50,),
                  RoundedPrimaryButton(label: 'Submit', onPressed: ()=> Navigator.pushNamed(context, HomeScreen.id))



                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
