import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/search_page.dart';
import '../pages/travel_page.dart';
import '../pages/my_page.dart';

class _PageBar {
  const _PageBar({this.name, this.icon});

  final IconData icon;
  final String name;
}

const List<_PageBar> pageNames = <_PageBar>[
  const _PageBar(
    name: '首页',
    icon: Icons.home,
  ),
  const _PageBar(
    name: '搜索',
    icon: Icons.search,
  ),
  const _PageBar(
    name: '旅拍',
    icon: Icons.camera,
  ),
  const _PageBar(
    name: '我的',
    icon: Icons.account_circle,
  ),
];

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigator createState() => _TabNavigator();
}

class _TabNavigator extends State<TabNavigator> {
  int _currentIndex = 0;

  final PageController _controller = PageController(
    initialPage: 0,
  );
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
    List<BottomNavigationBarItem> bottomNavigationBarItems =
        <BottomNavigationBarItem>[];
    for (var i = 0; i < pageNames.length; i++) {
      bottomNavigationBarItems.add(BottomNavigationBarItem(
          icon: Icon(
            pageNames[i].icon,
            color: _defaultColor,
          ),
          activeIcon: Icon(
            pageNames[i].icon,
            color: _activeColor,
          ),
          title: Text(
            pageNames[i].name,
            style: TextStyle(
                color: _currentIndex != i ? _defaultColor : _activeColor),
          )));
    }

    return bottomNavigationBarItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TarvelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: _buildBottomNavigationBarItem(),
      ),
    );
  }
}
