import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxy_fast_telegram/constants/colors.dart';
import 'package:proxy_fast_telegram/constants/sizes.dart';
import 'package:proxy_fast_telegram/screens/proxy_list/proxy_list_screen.dart';
import 'package:proxy_fast_telegram/screens/saved/saved_screen.dart';
import 'package:proxy_fast_telegram/screens/setting/setting_screen.dart';
import 'package:proxy_fast_telegram/services/nav_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // دیگر به متغیرهای selectedIndex و _routeHistory در اینجا نیازی نیست

  final GlobalKey<NavigatorState> _proxyListKey = GlobalKey();
  final GlobalKey<NavigatorState> _settingKey = GlobalKey();
  final GlobalKey<NavigatorState> _savedKey = GlobalKey();

  late final map = {
    BtmNavScreenIndex.proxyList: _proxyListKey,
    BtmNavScreenIndex.setting: _settingKey,
    BtmNavScreenIndex.saved: _savedKey,
  };

  Future<bool> _onWillPop(NavigationProvider navProvider) async {
    // از وضعیت داخل provider استفاده می‌کنیم
    if (map[navProvider.selectedIndex]!.currentState!.canPop()) {
      map[navProvider.selectedIndex]!.currentState!.pop();
    } else if (navProvider.routeHistory.length > 1) {
      // از متد goBack در provider استفاده می‌کنیم
      navProvider.goBack();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // به نمونه‌ی NavigationProvider دسترسی پیدا می‌کنیم
    final navProvider = Provider.of<NavigationProvider>(context);

    var size = MediaQuery.of(context).size;
    double btmNavHeight = size.height * .1;

    return WillPopScope(
      onWillPop: () => _onWillPop(navProvider),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: IndexedStack(
                  // از selectedIndex در provider استفاده می‌کنیم
                  index: navProvider.selectedIndex,
                  children: [
                    Navigator(
                      key: _proxyListKey,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                        builder: (context) => const ProxyListScreen(),
                      ),
                    ),
                    Navigator(
                      key: _settingKey,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                        builder: (context) => SettingScreen(),
                      ),
                    ),
                    Navigator(
                      key: _savedKey,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                        builder: (context) => const SavedScreen(),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.darkBackgroundDeep,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BtmNavItem(
                          icon: Icons.save_as_rounded,
                          isSelected:
                              navProvider.selectedIndex ==
                              BtmNavScreenIndex.saved,
                          ontap: () =>
                              navProvider.changeTab(BtmNavScreenIndex.saved),
                          text: 'Saved',
                        ),
                        BtmNavItem(
                          icon: Icons.list_alt,
                          isSelected:
                              navProvider.selectedIndex ==
                              BtmNavScreenIndex.proxyList,
                          ontap: () => navProvider.changeTab(
                            BtmNavScreenIndex.proxyList,
                          ),
                          text: 'Proxies',
                        ),
                        BtmNavItem(
                          icon: Icons.settings,
                          isSelected:
                              navProvider.selectedIndex ==
                              BtmNavScreenIndex.setting,
                          ontap: () =>
                              navProvider.changeTab(BtmNavScreenIndex.setting),
                          text: 'Settings',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // دیگر به متد btmNavOnPressed نیازی نیست
}

class BtmNavItem extends StatelessWidget {
  final IconData icon;
  final String text;
  Function() ontap;
  final bool isSelected;
  BtmNavItem({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.ontap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        color: Colors.transparent,

        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),

        child: Column(
          children: [
            Icon(
              icon,
              size: 30,
              color: isSelected
                  ? AppColors.selectedIconNavigationColor
                  : AppColors.iconSettingColor,
            ),
            SizedBox(height: AppSizes.sizedBoxVerySmall),
            Text(
              text,
              style: TextStyle(
                color: isSelected
                    ? AppColors.selectedIconNavigationColor
                    : AppColors.iconSettingColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
