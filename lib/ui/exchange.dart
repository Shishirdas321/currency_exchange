import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_picker_dropdown.dart';
import 'package:country_currency_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

import '../service/api_service.dart';

class Exchange extends StatefulWidget {
  const Exchange({super.key});

  @override
  State<Exchange> createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {

  ApiService apiService = ApiService();
  String _selectedBaseCurrency = "USD";
  String _selectedTargetCurrency = "USD";
  String _totalValue = "";
  final _textController = TextEditingController();

  Widget _dropDownItem(Country country)=>Container(
    child: Row(
      children: [
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(width: 8,),
        Text('${country.currencyName}'),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
        const  SizedBox(
            height: 8,
          ),
          Text('Base Currency',
            style: TextStyle(fontSize: 20,color: Colors.white),
          ),
         const SizedBox(
            height: 8,
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
            child: CountryPickerDropdown(initialValue: 'us',
              itemBuilder: _dropDownItem,
              onValuePicked: (Country? country){
                setState(() {
                  _selectedBaseCurrency = country?.currencyCode ?? "";
                });
              },
            ),
          ),

          const  SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 300,
            child: TextField(
              controller: _textController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
            ),
          ),


          const  SizedBox(
            height: 15,
          ),
          Text('Target Currency',
            style: TextStyle(fontSize: 20,color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
            child: CountryPickerDropdown(initialValue: 'GB',
              itemBuilder: _dropDownItem,
              onValuePicked: (Country? country){
                setState(() {
                  _selectedTargetCurrency = country?.currencyCode ?? "";
                });
              },
            ),
          ),

          const  SizedBox(
            height: 15,
          ),

          ElevatedButton(onPressed: () async {
            if(_textController.text.isNotEmpty){
              await apiService.getExchange(_selectedBaseCurrency, _selectedTargetCurrency).then((result){

                double value =double.parse(_textController.text);
                double exchangeRate =double.parse(result[0].value.toString());
                double total = value * exchangeRate;

                _totalValue = total.toStringAsFixed(2).toString();
                setState(() {});

              });
            }
          }, child: Text('Exchange',)),
          const  SizedBox(
            height: 15,
          ),

          Text(_totalValue,style: TextStyle(fontSize: 60,color: Colors.pink.shade300),
          ),
        ],
      ),
    );
  }
}
