import 'package:flutter/material.dart';
import 'package:scaped/src/presenters/widgets/post_card.dart';

import '../widgets/custom_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => const PostCard(),
      ),
    );
  }
}
