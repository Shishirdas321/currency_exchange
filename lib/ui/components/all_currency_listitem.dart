import 'package:currency_exchange/model/currency_model.dart';
import 'package:flutter/material.dart';
class AllCurrencyListitem extends StatelessWidget {
  final CurrencyModel currencyModel;
  const AllCurrencyListitem({super.key,required this.currencyModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.blue.withAlpha(88),borderRadius: BorderRadius.circular(10),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(currencyModel.code.toString(),style: TextStyle(color: Colors.white,fontSize: 17),),
          Text(currencyModel.value?.toStringAsFixed(2).toString() ??"",
            style: TextStyle(color: Colors.white,fontSize: 17),),
        ],
      ),
    );
  }
}
