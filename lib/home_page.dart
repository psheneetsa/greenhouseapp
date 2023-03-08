import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'routes/router.gr.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(

      //backgroundColor: Color.fromARGB(255, 66, 201, 142,),
      routes: const [
        HomeRouter(),
        StatRouter(),
        InfRouter(),
        ModulesRouter(),
        CabinetRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              unselectedColor: Color.fromARGB(255, 11, 83, 48),
              selectedColor: Color.fromARGB(255, 20, 123, 79),
              icon: const Icon(Icons.home_outlined, size: 25,),
              title: const Text('Home'),
            ),
            SalomonBottomBarItem(
              //rgb(14, 85, 55)
              unselectedColor: Color.fromARGB(255, 11, 83, 48),
              selectedColor: Color.fromARGB(255, 20, 123, 79),
              icon: const Icon(Icons.stacked_bar_chart, size: 25,),
              title: const Text('Stat'),
            ),
            SalomonBottomBarItem(
              unselectedColor: Color.fromARGB(255, 11, 83, 48),
              selectedColor: Color.fromARGB(255, 20, 123, 79),
              icon: const Icon(Icons.info_outline, size: 25,),
              title: const Text('Information'),
            ),
            SalomonBottomBarItem(
              unselectedColor: Color.fromARGB(255, 11, 83, 48),
              selectedColor: Color.fromARGB(255, 20, 123, 79),
              icon: const Icon(Icons.thermostat, size: 25,),
              title: const Text('Modules'),
            ),
            SalomonBottomBarItem(
              unselectedColor: Color.fromARGB(255, 11, 83, 48),
              selectedColor: Color.fromARGB(255, 20, 123, 79),
              icon: const Icon(Icons.cabin_outlined, size: 25,), //поменять
              title: const Text('Cabinet'),
            ),

          ],
        );
      },
    );
  }
}
