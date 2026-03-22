import 'package:flutter/material.dart';
import 'package:trading_app/presentation_layer/ui_screens/common_screen.dart';
import 'package:trading_app/presentation_layer/ui_screens/watchlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const WatchlistScreen();
      case 1:
        return CommonScreen("Orders");
      case 2:
        return CommonScreen("GTT");
      case 3:
        return CommonScreen("Portfolio");
      case 4:
        return CommonScreen("Funds");
      case 5:
        return CommonScreen("Profile");
      default:
        return const WatchlistScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(_selectedPageIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "Watchlist",
            icon: Icon(Icons.bookmark_border),
          ),
          BottomNavigationBarItem(
            label: "Orders",
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          BottomNavigationBarItem(
            label: "GTT+",
            icon: Icon(Icons.trending_down_rounded),
          ),
          BottomNavigationBarItem(
            label: "Portfolio",
            icon: Icon(Icons.shopping_bag_outlined),
          ),
          BottomNavigationBarItem(
            label: "Funds",
            icon: Icon(Icons.wallet),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person_outline_rounded),
          ),
        ],
      ),
    );
  }
}
