import 'package:flutter/material.dart';

class MovieCard extends StatefulWidget {
  var movie;
  final index;
  var genres='';
  MovieCard(movie,this.index){
  this.movie=movie;
  var temp =movie['genres'].split(", ");
  for(var i=0;i<temp.length;i++){
   this.genres+= temp[i] + ' | ';
  }
  }


  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
      
      Padding(
      padding:EdgeInsets.only(top:70,left:10,right: 10),
      child:Container(
        
        padding: EdgeInsets.only(left:130,bottom:60,top: 20),
      decoration:BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      boxShadow: [BoxShadow(color:Colors.black.withOpacity(0.06),blurRadius: 11,spreadRadius: 12,offset: Offset(0,50))],
            color: Colors.white,

      ),
      child:
            //************Movie Details*********************** */

        Container(
          child:Center(
            child:Column(
              children: [
              Padding(
                padding: EdgeInsets.only(right:0),
                child:Container(
                width:160,
                child: Text(widget.movie['title'],
                style:TextStyle(fontWeight: FontWeight.bold,fontSize:20),
                overflow: TextOverflow.clip,
      softWrap: true,),
              ),
              ),
                          SizedBox(height:5,),

              Padding(
                padding:EdgeInsets.only(right:0), 
              child:Container(
                width:155,
                child: Text(widget.genres,
                style:TextStyle(fontWeight: FontWeight.normal,fontSize:12,color:Colors.black.withOpacity(0.5)),
                overflow: TextOverflow.clip,
      softWrap: true,),
              ),
              ),
              Padding(
                padding:EdgeInsets.only(right:90,top:10),
                child: Container(

                  padding: EdgeInsets.only(left: 10,right: 10,top:5,bottom:5),
                width:70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:widget.index==0? Colors.green:Colors.blue,

                ),
                child: Text(widget.movie['rating'] + ' IMDB',
                style:TextStyle(fontWeight: FontWeight.normal,fontSize:12,color:Colors.white),
                overflow: TextOverflow.clip,
      softWrap: true,),
              ),
              ),
             ],
              ),)
        )
        
      
      )
    ),
      
      //************Image*********************** */
         Padding(padding: EdgeInsets.all(20),
         child:Container(
          height:190,
          width: 130,
          decoration: BoxDecoration(
      boxShadow: [BoxShadow(color:Colors.black.withOpacity(0.06),blurRadius:20,spreadRadius:25,offset: Offset(0,10))],
            borderRadius: BorderRadius.circular(10),
            image:DecorationImage(
              image:NetworkImage(widget.movie['image']),
              fit: BoxFit.cover )
          ),   
          ),
         )
      ]
    );
  }
}