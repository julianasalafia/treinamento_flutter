import 'package:flutter/material.dart';
import 'package:to_do_list/app/components/filter_list_component.dart';
import 'package:to_do_list/app/widgets/filter_item_widget.dart';
import 'package:to_do_list/app/widgets/header_widget.dart';
import 'package:to_do_list/app/widgets/home_app_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBarWidget(
        title: const Text('Hoje'),
        onPreviousTap: () {},
        onNextTap: () {},
        onTitleTap: (date) {},
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            HeaderWidget(),
            SizedBox(height: 20),
            FilterListComponent(),
          ],
        ),
      ),
    );
  }
}
