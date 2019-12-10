import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:new_app/models/author.dart';
import 'package:new_app/utilities/api_utilities.dart';

class AuthorAPI {

  String allAuthorApi = base_api + all_authors;

  Future<List<Author>> fetchAllAuthors() async{
    List<Author> authors = List<Author>();

    var response = await http.get(allAuthorApi);

    if( response.statusCode == 200 ){

      var jsonData = jsonDecode( response.body );
var data = jsonData['data'];

for( var item in data ){
  Author author =Author(item["id"].toString(),item["name"].toString(), item["email"].toString(), item["avatar"].toString());
  authors.add(author);
}

    }


    return authors;

  }

}