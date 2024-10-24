import 'dart:convert';

import 'package:api_exp_302/model/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as webClient;

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  UserDataModel? users;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
      ),
      body: FutureBuilder<UserDataModel?>(
        future: getUsers(),
        builder: (_, snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshots.hasError) {
            return Center(
              child: Text('Error: ${snapshots.error}'),
            );
          }

          if (snapshots.hasData) {
            return snapshots.data != null
                ? snapshots.data!.users!.isNotEmpty
                    ? ListView.builder(
              itemCount: snapshots.data!.users!.length,
                itemBuilder: (_, index){
                      return ListTile(
                        title: Text('${snapshots.data!.users![index].firstName}'),
                        subtitle: Text('${snapshots.data!.users![index].address!.address}'),
                      );
            })
                    : Center(
                        child: Text('No Users found!!'),
                      )
                : Center(
                    child: Text('Data not received!!'),
                  );
          }

          return Container();
        },
      ),
    );
  }

  Future<UserDataModel?> getUsers() async {
    var res = await webClient.get(Uri.parse("https://dummyjson.com/users"));
    print(res.body);

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      return UserDataModel.fromJson(data);
    }
  }
}
