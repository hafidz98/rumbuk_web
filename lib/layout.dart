import 'package:flutter/material.dart';
import 'package:rumbuk_web/widgets/custom_appbar.dart';
import 'package:rumbuk_web/widgets/side_menu.dart';
import 'package:rumbuk_web/widgets/top_nav.dart';
import 'helpers/responsiveness.dart';
import 'widgets/large_screen.dart';
import 'widgets/small_screen.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  SiteLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        extendBodyBehindAppBar: false,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: CustomAppBar(scaffoldKey: scaffoldKey)),
        drawer: const Drawer(child: SideMenu()),
        body: const ResponsiveWidget(
          largeScreen: LargeScreen(),
          smallScreen: SmallScreen(),
        ));
  }
}
