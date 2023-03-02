import 'package:flutter/material.dart';
import 'package:semester_tracker/models/appBanner.dart';
import 'package:semester_tracker/ui/bannerItem.dart';
import 'package:semester_tracker/ui/indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            height: 160,
            decoration: const BoxDecoration(color: Colors.white),
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.7),
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              itemCount: appBannerList.length,
              itemBuilder: (context, index) {
                var banner = appBannerList[index];
                var _scale = _selectedIndex == index ? 1.0 :0.8;
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => screens[index]));
                    },
                    child: TweenAnimationBuilder(
                      curve: Curves.ease,
                      tween: Tween(begin: _scale,end: _scale),
                      duration: const Duration(milliseconds: 350),
                      builder: (BuildContext context, double value, Widget? child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      },
                      child: BannerItem(
                        appBanner: banner
                      ),
                    ));
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  appBannerList.length,
                  (index) => Indicator(
                      isActive: _selectedIndex == index ? true : false))
            ],
          )
        ],
      ),
    );
  }
}


