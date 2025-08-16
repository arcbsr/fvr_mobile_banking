import 'package:flutter/material.dart';
import 'package:moix_app/features/more/pages/more_screens.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeAccountsLoaded) {
            // Log the API results
            print('=== ACCOUNTS API RESPONSE ===');
            print('Status: ${state.accountsData.status}');
            print('User Name: ${state.accountsData.userName}');
            print('Mobile: ${state.accountsData.mobile}');
            print('KYC Verified: ${state.accountsData.isKycVerified}');
            print('Total Balance: ${state.accountsData.totalBalance}');
            print('Business Status: ${state.accountsData.businessStatus}');
            print('Accounts Count: ${state.accountsData.data?.length ?? 0}');
            
            if (state.accountsData.data != null) {
              for (int i = 0; i < state.accountsData.data!.length; i++) {
                final account = state.accountsData.data![i];
                print('Account ${i + 1}:');
                print('  - ID: ${account.id}');
                print('  - Account No: ${account.accountNo}');
                print('  - Type: ${account.accountType}');
                print('  - Balance: ${account.balance}');
                print('  - Account Balance: ${account.accountBalance}');
                print('  - Is Activated: ${account.isActivated}');
                print('  - Created: ${account.createdDtm}');
              }
            }
            print('=============================');
          } else if (state is HomeError) {
            print('=== ACCOUNTS API ERROR ===');
            print('Error: ${state.message}');
            print('==========================');
          }
        },
        child: Builder(
          builder: (context) {
            // Now we can safely access the HomeBloc
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                context.read<HomeBloc>().add(LoadAccounts());
              }
            });
            
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
                        // Debug info
                        BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                            if (state is HomeLoading) {
                              return const Text('Loading accounts...', style: TextStyle(color: Colors.blue));
                            } else if (state is HomeError) {
                              return Text('Error: ${state.message}', style: const TextStyle(color: Colors.red));
                            } else if (state is HomeAccountsLoaded) {
                              return Text('Accounts loaded: ${state.accountsData.data?.length ?? 0} accounts', style: const TextStyle(color: Colors.green));
                            } else {
                              return const Text('Initial state', style: TextStyle(color: Colors.grey));
                            }
                          },
                        ),
                        SizedBox(
                          height: 170.h,
                          child: RecentTransfers(),
                        ),
                        SizedBox(height: 10.h),
                        Expanded(child: LatestTransactions()),
                      ],
                    ),
                    // Cards page
                    const CardsScreen(),
                    // Scan page
                    ScanScreen(),
                    // Transfer page
                    TransferScreen(),
                    // More Screen Page
                    MoreScreens(),
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
          },
        ),
      ),
    );
  }
} 