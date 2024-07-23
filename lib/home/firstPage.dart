import 'package:cargoapp/account/accountPage.dart';
import 'package:cargoapp/cart/cartPage.dart';
import 'package:cargoapp/feed/feedPage.dart';
import 'package:cargoapp/home/homePage.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentPage = HomePage();
  String titlePage = 'Home';

  void onItemSelect(int index){
    setState(() {
      selectedIndex = index;
      if (selectedIndex == 0) {
        currentPage = HomePage();
        titlePage = 'Home';
      }else if(selectedIndex == 1){
        currentPage = FeedPage();
        titlePage = 'Feed';
      }else if(selectedIndex == 2){
        currentPage = CartPage();
        titlePage = 'Cart';
      }else if(selectedIndex == 3){
        currentPage = AccountPage();
        titlePage = 'Account';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('${titlePage}'),
      //   centerTitle: true,
      // ),
      extendBody: true,
      body: SafeArea(
        child: PageStorage(
          bucket: bucket, child: currentPage),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemSelect,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 25,),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, size: 25,),
            label: 'Feed'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.difference),
            label: 'Cart'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add),
            label: 'Account'
          ),
        ],
      ),
    );
  }
}