import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List _imageUrls = [
    'https://dimg04.c-ctrip.com/images/zg0s180000014rym6B157.jpg',
    'https://dimg07.c-ctrip.com/images/100e0h0000008rp39A12F_C_750_375.jpg',
    'https://dimg04.c-ctrip.com/images/zg0k12000000t9l0j1CA7.png'
  ];

  double appBarAlpha = 0;

  _onScroll(offset) {
    if (offset <= APPBAR_SCROLL_OFFSET && offset >= 0) {
      setState(() {
        appBarAlpha = offset / 100;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: NotificationListener(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollNotification &&
                  scrollNotification.depth == 0) {
                _onScroll(scrollNotification.metrics.pixels);
              }
            },
            child: ListView(
              children: <Widget>[
                Container(
                  height: 160,
                  child: Swiper(
                    itemCount: _imageUrls.length,
                    autoplay: true,
                    pagination: SwiperPagination(),
                    itemBuilder: (BuildContext context, index) {
                      return Image.network(
                        _imageUrls[index],
                        fit: BoxFit.fill,
                      );
                    },
                  ),
                ),
                Container(
                  height: 800,
                  child: ListTile(
                    title: Text('哈哈'),
                  ),
                )
              ],
            ),
          ),
        ),
        Opacity(
          opacity: appBarAlpha,
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('首页'),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
