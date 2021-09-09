import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onchanged;
  const SearchBar({ Key? key,required this.controller,required this.onchanged }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Container(
      width:width/1.1,
      height: 50,
      padding:EdgeInsets.only(left:30,right:10,bottom:5),
    
      decoration: BoxDecoration(
        border: Border.all(
                    width:2, 
                    color: Colors.black.withOpacity(0.5)
                ),
      color: Colors.white,
      ),
      child:TextField(
        onSubmitted:widget.onchanged,
      
        controller: widget.controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border:InputBorder.none,
          labelText:"Search For Movies",
          labelStyle:TextStyle(color:Colors.black),
          suffixIcon: Padding(padding:EdgeInsets.only(top:10,left:100),
           child:Icon(Icons.search,color: Colors.black,)),
        ),
      )
      
    );
  }
}