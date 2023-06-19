import 'package:flutter/material.dart';
import 'package:school/scenes/home/tabs/profile_tab.dart';
import 'package:school/scenes/home/tabs/to_do_tab.dart';

import '../../components/app_bar_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int abaSelecionada;

  final List<BottomNavigationBarItem> _abas = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle), label: 'Perfil'),
  ];

  final List<Widget> _conteudos = [
    const ToDoTab(),
    const ProfileTab(),
  ];

  void handleTab(int tabIdx) {
    setState(() {
      abaSelecionada = tabIdx;
    });
  }

  @override
  void initState() {
    abaSelecionada = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(),
      body: _conteudos.elementAt(abaSelecionada),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: abaSelecionada,
        items: _abas,
        onTap: handleTab,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          handleTab(1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
