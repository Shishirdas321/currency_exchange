import 'package:currency_exchange/ui/exchange.dart';
import 'package:currency_exchange/ui/home.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int _selectedIndex = 0;

  Widget getView(){
    if(_selectedIndex == 0){
      return Home();
    }else{
      return Exchange();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:const Text('Currency Convert'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: getView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        items:  [
          const BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          const BottomNavigationBarItem(icon: Icon(Icons.currency_exchange),label: 'Exchange'),

        ],
      ),
    );
  }
}
