import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:just_app/src/models/user_model.dart';

import '../provider/db_provider.dart';

class UsersService extends ChangeNotifier {
  final String urlBase = 'https://justificacion.rrvc.server.rrvc.dev';

  List<UserModel> users = [];

  UsersService(){
    cargarUsers();
  }

  Future<void> cargarUsers() async {
    final url = Uri.parse("$urlBase/api/usuarios/profesores-alumno");
    final db = DBProvider.db;
    final tokenStorage = await db.getStorage('token');

    if(tokenStorage == null) return;

    final resp = await http.get(url, headers: {
      'Authorization': 'Bearer ${tokenStorage.value}'
    });

    final List<dynamic> usersList = json.decode(resp.body);

    for (var element in usersList) {
      final tempJustificacion = UserModel.fromJson(element);
      users.add(tempJustificacion);
    }

    notifyListeners();
  }
}