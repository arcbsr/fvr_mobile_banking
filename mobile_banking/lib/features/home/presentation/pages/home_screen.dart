import 'package:flutter/material.dart';
import '../widgets/home_header.dart';
import '../widgets/balance_card.dart';
import '../widgets/recent_transfers.dart';
import '../widgets/latest_transactions.dart';
import '../widgets/bottom_nav_bar.dart';
import 'cards_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../settings/presentation/pages/more_screen.dart';
import 'scan_screen.dart';
import 'transfer_screen.dart';

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
                HomeHeader(),
                const BalanceCard(),
                SizedBox(
                  height: 166.h,
                  child: RecentTransfers(),
                ),
                SizedBox(height: 16.h),
                Expanded(child: LatestTransactions()),
              ],
            ),
            // Cards page
            const CardsScreen(),
            // Scan page
            ScanScreen(),
            // Transfer page
            TransferScreen(),
            // More page
            MoreScreen(),
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