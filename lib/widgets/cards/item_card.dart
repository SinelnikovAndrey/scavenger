import 'dart:io';

import 'package:daily_scavenger/bloc/my_items_page_bloc/my_items_bloc.dart';
import 'package:daily_scavenger/data/models/item/item_data.dart';
import 'package:daily_scavenger/data/models/item/item_repo.dart';
import 'package:daily_scavenger/presentation/utils/app_colors.dart';
import 'package:daily_scavenger/presentation/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCard extends StatelessWidget {
  final ItemData item;
  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // ItemRepo orderProduct = ItemRepo(
    //   item: item,
    // );

    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRouter.itemDetailRoute,
          arguments: item,
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 15,
          right: 15,
          bottom: 15,
        ),
        width: 170,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.lightBorderGray,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image or icon
            if (item.photoUrl != null)
              Image.file(File(item.photoUrl!),
                  height: 120, width: 120, fit: BoxFit.cover)
            else
              const Icon(
                Icons.inventory,
                size: 100,
                color: AppColors.primary,
              ),
            const SizedBox(height: 20),
            // title
            Text(
              item.name,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            // unit

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
