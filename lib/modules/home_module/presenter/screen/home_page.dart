import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../../core/style/text_style.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leadingWidth: MediaQuery.sizeOf(context).width,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () => scaffoldKey.currentState?.openDrawer(),
                child: Text("MENU", style: Style.defaultStyle)),
          ],
        ),
      ),
      drawer: const DrawerMenu(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Page", textAlign: TextAlign.center, style: Style.greyStyle),
            const Gap(20),
            const RouterOutlet(),
            Text("I hope you enjoyed the app :)", textAlign: TextAlign.center, style: Style.greyStyle),
          ],
        ),
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(title: const Text('PEDIDOS'), onTap: () => Modular.to.pushNamed('/order/')),
            ListTile(title: const Text('RELATÓRIOS'), onTap: () => Modular.to.pushNamed('/report/')),
          ],
        ),
      ),
    );
  }
}
