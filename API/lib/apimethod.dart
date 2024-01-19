import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;

void main(){
  runApp(MaterialApp(home: api(),debugShowCheckedModeBanner: false,));
}
class api extends StatefulWidget {
  const api({super.key});

  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {

  void getApiFunc()async{
    print("Function started");
    var urlString="https://api.github.com/users/hadley/orgs";

    var url=Uri.parse(urlString);
    print("Api Initiated");
    var response=await http.get(url);
    print("Response came");
    print(response.body);
    print(response.statusCode);
  }

  void postMethodApiFunc()async{
    var urlString ="https://dog.ceo/api/breeds/list/all";
    var url=Uri.parse(urlString);
    var body={"year":"2020"};
    var bodyData=jsonEncode(body);
    var headers={"Content-Type":"application/json"};
    var response=await http.post(url,body: bodyData,headers: headers);
    print(response.statusCode);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body: Center(
        child: TextButton(onPressed: (){
          print("Button Clicked");
          getApiFunc();
          postMethodApiFunc();
          print("Completed");},
          child: Text("Tap me"),),
      ),

    );
  }
}
