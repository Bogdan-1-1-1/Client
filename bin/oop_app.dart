import 'dart:convert';

import 'package:oop_app/models/User.dart';
import 'package:http/http.dart' as http;
// ignore: avoid_relative_lib_imports
import '../lib/logger/Logger.dart';

String HOST = 'http://localhost:5000/api';
const HEADERS = {'content-type': 'application/json'};
void main(List<String> arguments) => appStart();

void appStart() async {
  //final dynamicList = await fetchUsers();
  //final users = <User>[];
  //dynamicList.forEach((userJson) => users.add(User.fromJson(userJson)));
  //users.forEach((user) {
  //  print(user);
  //});

  /*final newUser = User(
      name: 'Alexandra',
      gender: 'female',
      birthDate: '2020-12-21',
      interests: ['mammaMia', 'sallargoo', 'sss']);
  final result = await uploadUser(newUser.toJson());
  if (result != null) {
    print(result);
  }*/
  deleteById('6036acd2ea96153544a8b6ea');
}

dynamic fetchUsers() async {
  var response;
  try {
    response = await http.get('$HOST/users');
  } catch (e) {
    print(e);
  }
  return json.decode(response.body);
}

dynamic fetchUser(String id) async {
  var response;
  try {
    response = await http.get('$HOST/users/byId/$id');
  } catch (e) {
    print(e);
  }
  return json.decode(response.body);
}

dynamic uploadUser(Map<String, dynamic> userJson) async {
  http.Response response;
  var logger = Logger.getLogger();
  logger.setLogLevel(LogLevels.INFO);
  try {
    response = await http.post('$HOST/users/add',
        headers: HEADERS, body: json.encode(userJson));
    if (response.statusCode == 400) {
      print('Sorry, bad request: ' + response.body);
    }
    if (response.statusCode != 200) {
      logger.error(response.body);
    }
  } catch (e) {
    print(e);
  }
  logger.info('everything is good');
  return json.decode(response.body);
}

dynamic deleteOne() async {
  http.Response response;
  var logger = Logger.getLogger();
  logger.setLogLevel(LogLevels.INFO);
  try {
    response = await http.delete('$HOST/users/deleteOne');
    if (response.statusCode == 400) {
      print('Sorry, bad request: ' + response.body);
    }
    if (response.statusCode != 200) {
      logger.error(response.body);
    } else {
      print('Все норм, удалили');
    }
  } catch (e) {
    print(e);
  }
  return json.decode(response.body);
}

dynamic deleteById(String id) async {
  http.Response response;
  var logger = Logger.getLogger();
  logger.setLogLevel(LogLevels.INFO);
  try {
    response = await http.delete('$HOST/users/deleteByID/$id');
    if (response.statusCode == 400) {
      print('Sorry, bad request: ' + response.body);
    }
    if (response.statusCode != 200) {
      logger.error(response.body);
    } else {
      print('Все норм, удалили');
    }
  } catch (e) {
    print(e);
  }
  return json.decode(response.body);
}
