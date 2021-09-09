import 'package:flutter/material.dart';
import 'package:tradexatask/Widgets/MovieCard.dart';
import '../Widgets/searchBar.dart';
import '../StateManagement/MovieListController.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController searchBarController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var movieController=Get.put(MovieListController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
        title: Text("Home",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:25),),
        elevation: 0,
      ), 
      body:   GetBuilder<MovieListController>(
        builder:(controller){ 
      
        return
     
         Column(
        children: [
         
         Padding(padding:EdgeInsets.only(top:10,bottom:10),
         child: SearchBar(
            controller: searchBarController,
            onchanged:(string){
              controller.clearSearch();
              controller.searchMovies(string);
            },
          ),
         ),
          Expanded(child:ListView.builder(
            itemCount: controller.SearchedList.length,
            itemBuilder:(context,index){
                 return MovieCard(controller.SearchedList[index],index);
            })
          )
        ],
        );
      }
      )
    );
  }
}