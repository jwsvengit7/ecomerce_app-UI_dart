
import 'package:flutter/material.dart';
import 'package:light_height_ecomerce_app/presentation/views/app.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  FooterState createState() => FooterState();
}

class FooterState extends State<Footer> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 3) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => App()));
      } else if (index == 0) {
        Navigator.pushNamed(context, '/app');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.red,
      unselectedItemColor: Color.fromARGB(228, 10, 10, 10),
      selectedFontSize: 18,
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,size: 25,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search,size: 25,),
          label: 'Search',
        ),
          BottomNavigationBarItem(
          icon: Icon(Icons.money_sharp,size: 25,),
          label: 'Trade',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,size: 25,),
          label: 'Profile',
        ),
      ],
    );
  }
}