import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:httpanjana/model/Products.dart';
import 'package:httpanjana/model/RespMain.dart';
class Apiservice{
 Future<List<Products>?>  fetchdata() async {

   try{
     final response=await http.get(Uri.parse('https://dummyjson.com/products'));
     if(response.statusCode==200) {
       var jsonn = jsonDecode(response.body);
       var resp=RespMain.fromJson(jsonn);
       var list=resp.products;
       return list;
     }
   }catch(e){
     print("${e.toString()}");
   }
 }
}