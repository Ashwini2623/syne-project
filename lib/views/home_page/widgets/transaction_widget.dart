import 'package:flutter/material.dart';
import '../../../utils/constants.dart';

class TransactionWidget extends StatelessWidget {
  final int i;
  const TransactionWidget({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kWhiteColor,
              boxShadow: [
                BoxShadow(
                    blurRadius: 8.0,
                    spreadRadius: 2.0,
                    color: kGreyColor,
                    offset: Offset(0, 2))
              ]),
          child: Image.asset(
            '${kAssetPath}shopify.png',
          ),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '- ₹45,000',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w500, color: kRedColor),
            ),
            Text(
              'June 1,2023',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: kGreyColor),
            )
          ],
        ),
        title: Text(
          'Shopify',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          'Ux Research',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: kGreyColor),
        ),
      ),
    );
  }
}
