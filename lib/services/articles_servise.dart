

import 'package:http/http.dart' as http;



class ArticlesService {
  

  static Future<http.Response> getArticles(
       ) async {
   

    return await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {
          "Content-type": "application/json",
         
        },
      );
  }


  static Future<http.Response> getSingleArticle(String id) async {

    return await http.get(
      Uri.parse( "https://jsonplaceholder.typicode.com/posts/$id"),
      headers: {
        "Content-type": "application/json",
        
      },
    );
  }
}
