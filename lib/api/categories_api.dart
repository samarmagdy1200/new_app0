import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:new_app/models/category.dart';
import 'package:new_app/utilities/api_utilities.dart';
import 'dart:async';


class CategoriesApi {

  String allAuthorApi = base_api + all_categories_api;

  Future<List<Category>> fetchAllAuthors() async{
    List<Category> categories = List<Category>();

    var response = await http.get(allAuthorApi);

    if( response.statusCode == 200 ){

      var jsonData = jsonDecode( response.body );
      var articles = jsonData['data'];

      for( var item in articles ){
        Category category =Category(item["id"].toString(), item["title"].toString());
        categories.add(category);
      }

    }

    return categories;

  }

}