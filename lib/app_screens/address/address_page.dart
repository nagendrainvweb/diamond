import 'package:diamon_assorter/app_widget/address_form_widget.dart';
import 'package:diamon_assorter/app_widget/app_appbar.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/modal/address_data.dart';
import 'package:diamon_assorter/register/registerViewModel/registerViewModel.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key key}) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  _showBottomDialog(BuildContext context, AddressData data) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return AddressFormWidget(
            data: data,
            onSubmitClicked: (AddressData addressData) {
              if (data == null) {
                // model.onAddressAddedClicked(addressData);
              } else {
                // model.onEditAddress(addressData);
              }
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          _showBottomDialog(context,null);
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          AppAppBar(
            showBackButton: true,
          ),
          Expanded(
            child: ListView(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
