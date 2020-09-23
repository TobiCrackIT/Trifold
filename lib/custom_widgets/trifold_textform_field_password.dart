import 'package:flutter/material.dart';
import 'package:trifold/utils/colors/trifold_colors.dart';

class TrifoldTextformFieldPassword extends StatefulWidget {
  final String title;
  final TextEditingController textEditingController;
  final ValueChanged<String> onChanged;


  TrifoldTextformFieldPassword({this.title, this.textEditingController,this.onChanged});

  @override
  _TrifoldTextformFieldPasswordState createState() =>
      _TrifoldTextformFieldPasswordState();
}

class _TrifoldTextformFieldPasswordState
    extends State<TrifoldTextformFieldPassword> {
  bool hideText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 41,
      margin: EdgeInsets.only(left: 30,right: 30,top: 24),
      child: TextFormField(
        maxLines: 1,
        obscureText: hideText,
        autovalidate: false,
        keyboardType: TextInputType.visiblePassword,
        controller: widget.textEditingController,
        onChanged: widget.onChanged,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Color(0xFF4F4C4F),
          fontSize: 18,
          fontStyle: FontStyle.normal,
        ),
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.vpn_key,
              color: Color(
                0xff6F6C6E,
              ),
            ),
            labelText: '${widget.title}',
            fillColor: Colors.white,
            filled: true,
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              color: Color(0xff4F4C4F),
            ),
            hasFloatingPlaceholder: false,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              borderSide: BorderSide(
                color: Color(0xFFE5E5E5),
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color(0xFFE5E5E5),
                    width: 2,
                    style: BorderStyle.solid)),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  hideText = !hideText;
                });
              },
              child: Icon(
                hideText == true ? Icons.visibility : Icons.visibility_off,
                color: Color(
                  0xff6F6C6E,
                ),
              ),
            )),
      ),
    );
  }
}
