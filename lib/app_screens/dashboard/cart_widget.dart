import 'package:flutter/material.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({ Key key }) : super(key: key);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Shopping cart"),),
    );
  }
}