
import 'package:daily_scavenger/presentation/pages/history_item/history_page.dart';
import 'package:daily_scavenger/presentation/pages/home/my_items_page.dart';
import 'package:daily_scavenger/presentation/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:flutter_svg/svg.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x7FE6EAF3),
              blurRadius: 37,
              offset: Offset(0, -12),
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset(
                SvgAssets.shop,
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              selectedIcon: SvgPicture.asset(SvgAssets.shop),
              label: 'Shop',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                SvgAssets.explore,
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              selectedIcon: SvgPicture.asset(SvgAssets.explore),
              label: 'Explore',
            ),
            // BlocBuilder<MyItemsBloc, MyItemsState>(
            //   builder: (context, state) {
            //     return NavigationDestination(
            //       icon: Badge(
            //         backgroundColor: AppColors.primary,
            //         isLabelVisible: ItemRepository.cart.isNotEmpty,
            //         label: Text(
            //           ItemRepository.cart.length.toString(),
            //         ),
            //         offset: const Offset(10, -10),
            //         child: SvgPicture.asset(
            //           SvgAssets.cart,
            //           colorFilter: const ColorFilter.mode(
            //             Colors.black,
            //             BlendMode.srcIn,
            //           ),
            //         ),
            //       ),
            //       selectedIcon: Badge(
            //         backgroundColor: AppColors.primary,
            //         isLabelVisible: ItemRepository.cart.isNotEmpty,
            //         label: Text(
            //           ItemRepository.cart.length.toString(),
            //         ),
            //         offset: const Offset(10, -10),
            //         child: SvgPicture.asset(SvgAssets.cart),
            //       ),
            //       label: 'Cart',
            //     );
            //   },
            // ),
            NavigationDestination(
              icon: SvgPicture.asset(
                SvgAssets.favorite,
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              selectedIcon: SvgPicture.asset(SvgAssets.favorite),
              label: 'Favorites',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                SvgAssets.user,
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              selectedIcon: SvgPicture.asset(SvgAssets.user),
              label: 'Account',
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: const [
         MyItemsPage(),
          HistoryPage(),
          MyItemsPage(),
          MyItemsPage(),
        ],
      ),
    );
  }
}
