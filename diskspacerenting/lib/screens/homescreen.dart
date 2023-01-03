import 'package:diskspacerenting/components/blockchainvideoloop.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Color(0xff150a34)),
      child: Column(
        children: [
          Row(
            children: [Spacer(), BlockChainVideoLoop()],
          )
        ],
      ),
    )));
  }
}
