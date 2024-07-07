import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperapp/category.dart';
import 'package:wallpaperapp/home.dart';
import 'package:wallpaperapp/searchpage.dart';

class BottomNavigate extends StatefulWidget {
  const BottomNavigate({super.key});

  @override
  State<BottomNavigate> createState() => _BottomNavigateState();
}

class _BottomNavigateState extends State<BottomNavigate> {
  int selectindex= 0;
  final List<Widget>pages=[
    HomePage(),
    SearchPage(),
    Category()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectindex],
      bottomNavigationBar: CurvedNavigationBar(
        color: const Color.fromARGB(255, 116, 112, 112),
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.black,
        index: selectindex,
        items: [
        Icon(Icons.home,color: Colors.white,),
        Icon(Icons.search,color: Colors.white,),
        Icon(Icons.category,color: Colors.white,),
      
      ],
      onTap: (value) {
        setState(() {
          selectindex=value;
        });
      },
      ),
    );
  }
}