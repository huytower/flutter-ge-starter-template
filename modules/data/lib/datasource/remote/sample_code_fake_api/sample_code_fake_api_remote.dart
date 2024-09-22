import '../../../config/retrofit/response/body/cc_res_body_model.dart';
import '../../../entities/sample_code_fake_api/res_sample_code_fake_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'sample_code_fake_api_remote.g.dart';

@lazySingleton
@RestApi()
abstract class SampleCodeFakeApiRemote {
  @factoryMethod
  factory SampleCodeFakeApiRemote(Dio dio, {@Named('baseUrl') String baseUrl}) = _SampleCodeFakeApiRemote;

  @GET('/api/category/list')
  // @GET('/api/news/list')
  Future<CcResBodyModel<ResSampleCodeFakeModel>> getList();

  @GET('/api/news/get-id/{id}')
  Future<CcResBodyModel<ResSampleCodeFakeModel>> getObj(@Path('id') String id);
}
