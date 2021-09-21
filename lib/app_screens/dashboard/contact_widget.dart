import 'package:flutter/material.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget({ Key key }) : super(key: key);

  @override
  _ContactWidgetState createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Contact Widget"),),
    );
  }
}