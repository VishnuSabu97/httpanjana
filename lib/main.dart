import 'package:flutter/material.dart';
import 'package:httpanjana/webservice/apiservice.dart';

import 'model/Products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
Apiservice apiservice=Apiservice();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
  appBar: AppBar(),
      body: FutureBuilder(future: apiservice.fetchdata(),
        builder: (BuildContext context, AsyncSnapshot<List<Products>?> productlist) {
        if(productlist.hasData){
          return ListView.builder(itemCount: productlist.data!.length,
            itemBuilder: (BuildContext context, int index) {
            Products products=productlist.data![index];
            return ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage('${products.thumbnail}'),
              ),
              title: Text('${products.title}'),
              subtitle: Text('${products.price}'),
            );
            },);
        }
        else if(productlist.hasError){
          return Center(child: Text("having error"),);
        }
        else{
          return Center(child: CircularProgressIndicator());
        }

      },),
    );
  }
}
