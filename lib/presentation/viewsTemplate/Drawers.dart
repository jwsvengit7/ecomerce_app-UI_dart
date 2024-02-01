

import 'package:flutter/material.dart';
import 'package:light_height_ecomerce_app/presentation/views/login.dart';

import 'package:provider/provider.dart';

class Drawers extends StatelessWidget {
  const Drawers({super.key});

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
        const  DrawerHeader(
            decoration:  BoxDecoration(
              color: Colors.lightBlue,
            ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                 Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(height: 10),
             
               
                  Text(
                   "User Info",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {},
          ),
        
          ListTile(
            leading: const Icon(Icons.currency_bitcoin),
            title: const Text('Exchange Coin'),
            onTap: () {},
          ),
        
        
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Login()),
              );
            },
          ),
        ],
      ),
    );
  }
}