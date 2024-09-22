import 'package:data/entities/home/read_by_id/res_read_by_id_entity.dart';
import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'home_remote.g.dart';

// @singleton
@RestApi()
abstract class HomeRemote {
  // @factoryMethod
  // factory HomeRemote(Dio dio, {
  //   @Named('host_moon_sheep')
  //   String baseUrl}) =
  //     _HomeRemote;

  @POST('/api/PoemAlbums/ReadByIDs')
  Future<List<ResReadByIdEntity>> readIds(@Body() dynamic body);
}
