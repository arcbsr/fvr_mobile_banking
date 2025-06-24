import 'package:flutter/material.dart';
import 'widgets/home_header.dart';
import 'widgets/balance_card.dart';
import 'widgets/recent_transfers.dart';
import 'widgets/latest_transactions.dart';
import 'widgets/bottom_nav_bar.dart';
import 'cards_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            // Home page
            Column(
              children: [
                const HomeHeader(),
                const BalanceCard(),
                SizedBox(
                  height: 145.h,
                  child: RecentTransfers(),
                ),
                const Expanded(child: LatestTransactions()),
              ],
            ),
            // Cards page (to be implemented)
            const CardsScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
} 