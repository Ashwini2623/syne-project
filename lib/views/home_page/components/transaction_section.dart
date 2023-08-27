import 'package:flutter/material.dart';
import 'package:project/utils/custom_padding.dart';
import 'package:project/views/home_page/widgets/transaction_widget.dart';

import '../../../utils/constants.dart';

class TransactionSection extends StatefulWidget {
  const TransactionSection({super.key});

  @override
  State<TransactionSection> createState() => _TransactionSectionState();
}

class _TransactionSectionState extends State<TransactionSection> {
  final int itemsPerPage = 10;
  List<int> dataList = [];

  bool isLoading = false;

  List<int> generateData(int start, int count) {
    return List.generate(count, (index) => start + index);
  }

  @override
  void initState() {
    super.initState();
    _loadMoreData();
  }

  Future<void> _loadMoreData() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    final newData = generateData(dataList.length + 1, itemsPerPage);

    setState(() {
      dataList.addAll(newData);
      isLoading = false;
    });
  }

  @override
  void dispose() {
    isLoading;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomPadding(
              h: 16.0,
              child: Text(
                'Transactions',
                style: Theme.of(context).textTheme.bodyLarge,
              )),
          kSizedBoxHeight(8.0),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dataList.length + 1,
            itemBuilder: (context, i) {
              if (i < dataList.length) {
                return TransactionWidget(i: i);
              } else {
                if (isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: kCardColor,
                    ),
                  );
                } else {
                  return Center(
                    child: GestureDetector(
                      onTap: _loadMoreData,
                      child: Text('Load More',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  );
                }
              }
            },
          ),
          kSizedBoxHeight(16.0)
        ],
      ),
    );
  }
}
