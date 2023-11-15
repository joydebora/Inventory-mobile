import 'package:flutter/material.dart';
// Impor drawer widget

import 'package:inventory/models/item.dart';

import 'package:inventory/widgets/left_drawer.dart';
import 'package:inventory/widgets/menu_item.dart';
import 'package:inventory/widgets/menu_card.dart';

import 'package:inventory/screens/inventory_form.dart';
import 'package:inventory/screens/inventory_list.dart';

class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);
    
    final List<MenuItem> menuItems = [
      MenuItem(
        title: 'Lihat Item',
        icon: Icons.list_alt_outlined,
        color: const Color(0xFF8A2BE2),
        onTap: (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItemListPage(items: items)),
        );
      },
      ),
    MenuItem(
      title: 'Tambah Item',
      icon: Icons.add,
      color: const Color(0xFFFF6F61),
      onTap: (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ShopFormPage()),
        );
      },
    ),
    MenuItem(
      title: 'Logout',
      icon: Icons.logout,
      color: const Color(0xFFDC143C),
      onTap: (BuildContext context) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(const SnackBar(
            content: Text("Kamu telah menekan tombol Logout!"),
            duration: Duration(seconds: 2),
          ));
      },
    ),
  ];

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Petkeeper Inventory',
            ),
        backgroundColor: Colors.indigo, //App Bar background color
        foregroundColor: Colors.white, //Text color
    ),
    // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
    drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Petkeeper Inventory', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20.0),
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: menuItems.map((item) {
                  return MenuCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}