import 'package:flutter/material.dart';
import 'package:patient_care/view/account_page.dart';
import 'package:patient_care/colors.dart';
import 'inbox_page.dart';
import 'notification_page.dart';

class HomePage extends StatelessWidget {
  static route() {
    return MaterialPageRoute(builder: (_) => HomePage());
  }

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _valueNotifier,
      builder: (_, int currentIndex, widget) {
        return Container(
          color: PatientCareColors.white,
          child: SafeArea(
            child: Scaffold(
              body: _screens[currentIndex],
              bottomNavigationBar: BottomAppBar(
                child: NavigationBar(
                  onDestinationSelected: (index) {
                    _valueNotifier.value = index;
                  },
                  selectedIndex: currentIndex,
                  backgroundColor: Colors.white,
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      label: 'Home',
                      selectedIcon: Icon(
                        Icons.home_outlined,
                        color: PatientCareColors.black,
                      ),
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.messenger_outline_rounded),
                      label: 'Inbox',
                      selectedIcon: Icon(Icons.messenger_outline_rounded),
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.notifications_none_rounded),
                      label: 'Notification',
                      selectedIcon: Icon(Icons.notifications_none_rounded),
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.person_outline_rounded),
                      label: 'Account',
                      selectedIcon: Icon(Icons.person_outline_rounded),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  final ValueNotifier<int> _valueNotifier = ValueNotifier<int>(0);

  final List<Widget> _screens = const [
    HomeView(),
    InboxPage(),
    NotificationPage(),
    AccountPage(),
  ];
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text("Home"),
        ),
      ],
    );
  }
}
