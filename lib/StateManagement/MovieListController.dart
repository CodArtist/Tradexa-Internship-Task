import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MovieListController extends GetxController{
  var MovieList=[];
  var SearchedList=[];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
 
  
  void searchMovies(movie_name)async{
    if(movie_name!='')
    {var url =Uri.parse('https://imdb-api.com/en/API/Search/k_xoyvo7vq/' + movie_name);
      

  var response = await http.get(url);
  if (response.statusCode == 200) {
     var result=convert.jsonDecode(response.body) as Map<String, dynamic>;
     var movies=result['results'];
     
     
     for(var i=0;i<movies.length;i++){
        var movie_id=movies[i]['id'];
        var title_url=Uri.parse('https://imdb-api.com/en/API/Title/k_xoyvo7vq/' + movie_id);
        var movie_response=await http.get(title_url);
        
     if (movie_response.statusCode == 200) 
     {     
         var result1=convert.jsonDecode(movie_response.body) as Map<String, dynamic>;
         var genre=result1['genres'];
         var rating=result1['imDbRating'];
         movies[i]['genres']=genre;
         movies[i]['rating']=rating;

     }
     }
   
     SearchedList=movies;
     update();
    
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
else
{
SearchedList.clear();
update();
}

  }


  void clearSearch(){
    SearchedList.clear();
    update();
  }

}



