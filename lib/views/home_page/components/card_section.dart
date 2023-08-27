import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:project/shared/routing/routing.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/constants.dart';
import '../../../utils/custom_padding.dart';

class CardSection extends HookWidget {
  const CardSection({super.key});

  @override
  Widget build(BuildContext context) {
    final useCarousel = useState<int>(0);

    return SliverToBoxAdapter(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
          CustomPadding(
            h: 16.0,
            v: 8.0,
            child: Text(
              'Cards',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          CustomPadding(
            h: 16.0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    onTap: () {
                      AddTxnPageRoute().push(context);
                    },
                    child: Text(
                      'ADD NEW ',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: kBlueColor),
                    ),
                  ),
                  const Icon(Icons.add, size: 16.0)
                ]),
          ),
          kSizedBoxHeight(8.0),
          CarouselSlider.builder(
              itemCount: 5,
              itemBuilder: (_, i, r) {
                return CreditCardWidget(
                    cardNumber: '8428 1698 3299 3243',
                    expiryDate: '26/24',
                    isChipVisible: true,
                    labelValidThru: 'Expiry : ',
                    width: double.infinity,
                    cardHolderName: 'Emma Larsen',
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: kWhiteColor),
                    cardType: CardType.visa,
                    obscureInitialCardNumber: false,
                    labelCardHolder: 'Card Holder',
                    isHolderNameVisible: true,
                    cvvCode: '4567',
                    showBackView: false,
                    cardBgColor: kBlueColor,
                    onCreditCardWidgetChange:
                        (CreditCardBrand creditCardBrand) {});
              },
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                viewportFraction: 0.8,
                onPageChanged: (i, r) {
                  useCarousel.value = i;
                },
                enableInfiniteScroll: true,
              )),
          Center(
            child: AnimatedSmoothIndicator(
                count: 5,
                activeIndex: useCarousel.value,
                effect: const WormEffect(
                    paintStyle: PaintingStyle.stroke,
                    activeDotColor: kBlueColor,
                    dotHeight: 8,
                    dotWidth: 8)),
          ),
          kSizedBoxHeight(24.0),
        ]));
  }
}
