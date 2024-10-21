import 'dart:convert';

import 'package:api_exp_302/model/quote_data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as webClient;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataModel? mData;

  @override
  initState() {
    super.initState();
    getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    getQuotes();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: mData!=null ? mData!.quotes.isNotEmpty ? ListView.builder(
          itemCount: mData!.quotes.length,
            itemBuilder: (_, index){
            return Card(
              child: ListTile(
                title: Text('${mData!.quotes[index].quote}'),
                subtitle: Text('- ${mData!.quotes[index].author}'),
              ),
            );
        }): Center(child: Text('No Quotes found!!'),) : Center(child: Text('Data not received!!'),),
      ),
    );
  }

  getQuotes() async{

    String url = "https://dummyjson.com/quotes";

    webClient.Response response = await webClient.get(Uri.parse(url));

    if(response.statusCode==200){
      print(response.body);

      var actualData = jsonDecode(response.body);

      mData = DataModel.fromJson(actualData);
      setState(() {

      });
    }

  }
}
