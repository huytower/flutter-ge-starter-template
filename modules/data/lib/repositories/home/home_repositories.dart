import 'dart:async';

import 'package:data/datasource/remote/home/home_remote.dart';
import 'package:data/entities/home/read_by_id/res_read_by_id_entity.dart';
import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';

abstract class HomeRepositories {
  List<String> getList();

  Future<List<ResReadByIdEntity>> readId();

  void dispose();
}

// @Singleton(as: HomeRepositories)
class HomeRepositoriesImpl implements HomeRepositories {
  HomeRepositoriesImpl({
    required this.dio,
    required this.homeRemote,
  });

  final Dio dio;
  final HomeRemote homeRemote;

  @override
  List<String> getList() => ['', ''];

  @override
  Future<List<ResReadByIdEntity>> readId() async {
    var response = homeRemote.readIds([46]);
    return response;
  }

  // @disposeMethod
  @override
  void dispose() {
    // handle dispose local data.
  }
}
