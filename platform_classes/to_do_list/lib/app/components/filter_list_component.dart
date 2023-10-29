import 'package:flutter/material.dart';

import '../widgets/filter_item_widget.dart';

class FilterListComponent extends StatelessWidget {
  const FilterListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          FilterItemWidget(
            title: 'Todas',
            isSelected: true,
            notificationCount: 32,
            onTap: () {
              print('tapped');
            },
          ),
          const SizedBox(width: 6),
          const VerticalDivider(),
          const SizedBox(width: 6),
          FilterItemWidget(
            title: 'Abertas',
            isSelected: false,
            notificationCount: -1,
            onTap: () {},
          ),
          const SizedBox(width: 12),
          FilterItemWidget(
            title: 'Fechadas',
            isSelected: true,
            notificationCount: 0,
            onTap: () {},
          ),
          const SizedBox(width: 12),
          FilterItemWidget(
            title: 'Arquivadas',
            isSelected: true,
            notificationCount: 0,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
