import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/constants.dart';

class AddTransactionPage extends HookWidget {
  AddTransactionPage({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cardNumber = useState('');
    final expiryDate = useState('');
    final cardHolderName = useState('');
    final cvvCode = useState('');
    final isCvvFocused = useState(false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kBlackColor,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CreditCardForm(
                formKey: formKey,
                obscureCvv: false,
                obscureNumber: false,
                cardNumber: cardNumber.value,
                cvvCode: cvvCode.value,
                isHolderNameVisible: true,
                isCardNumberVisible: true,
                isExpiryDateVisible: true,
                cardHolderName: cardHolderName.value,
                expiryDate: expiryDate.value,
                themeColor: kCardColor,
                cardNumberDecoration: InputDecoration(
                  labelText: 'Number',
                  hintText: 'XXXX XXXX XXXX XXXX',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  labelStyle: Theme.of(context).textTheme.labelMedium,
                ),
                expiryDateDecoration: InputDecoration(
                    labelText: 'Expired Date',
                    hintText: 'XX/XX',
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    labelStyle: Theme.of(context).textTheme.labelMedium),
                cvvCodeDecoration: InputDecoration(
                    labelText: 'CVV',
                    hintText: 'XXX',
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    labelStyle: Theme.of(context).textTheme.labelMedium),
                cardHolderDecoration: InputDecoration(
                    labelText: 'Card Holder',
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    labelStyle: Theme.of(context).textTheme.labelMedium),
                onCreditCardModelChange: (CreditCardModel? creditCardModel) {
                  cardNumber.value = creditCardModel!.cardNumber;
                  expiryDate.value = creditCardModel.expiryDate;
                  cardHolderName.value = creditCardModel.cardHolderName;
                  cvvCode.value = creditCardModel.cvvCode;
                  isCvvFocused.value = creditCardModel.isCvvFocused;
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 0.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.pop();
                        }
                      },
                      child: const Text('Continue')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
