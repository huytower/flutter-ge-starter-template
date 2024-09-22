import 'dart:async';

import 'package:data/config/retrofit/response/body/cc_res_body_model.dart';
import 'package:data/datasource/remote/sample_code_fake_api/sample_code_fake_api_remote.dart';
import 'package:data/entities/sample_code_fake_api/res_sample_code_fake_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class SampleCodeFakeApiRepositories {
  Future<CcResBodyModel<ResSampleCodeFakeModel>> getList();

  Future<CcResBodyModel<ResSampleCodeFakeModel>> getObj(String id);
}

@LazySingleton(as: SampleCodeFakeApiRepositories)
class SampleCodeFakeApiImpl implements SampleCodeFakeApiRepositories {
  // final SampleCodeFakeApiRemote remote = SampleCodeFakeApiRemote(dio);

  @factoryMethod
  SampleCodeFakeApiImpl({required this.dio, required this.remote});

  final Dio dio;
  final SampleCodeFakeApiRemote remote;

  /// Free Fake Api End point : https://mockland.dev/api/news/list
  /// ex.
  /// {
  //     "status": true,
  //     "message": "News fetched",
  //     "total": 196,
  //     "data": [
  //         {
  //             "id": "clgsm9c6o00hivkuffqcoo5vo",
  //             "title": "US stocks rise but close lower for the week as investors mull mixed bag of corporate earnings",
  //             "description": "Mega-cap tech companies like Alphabet and Amazon are on deck to report quarterly results next week.",
  //             "content": "Traders work on the floor of the New York Stock ExchangeMichael M. Santiago/Getty Images\r\n<ul>\n<li>
  //             "url": "https://markets.businessinsider.com/news/stocks/stock-market-news-today-dow-sp500-nasdaq-mixed-earnings-reports-2023-4",
  //             "image": "https://i.insider.com/6442e7c5e1a96300185aa30d?width=1200&format=jpeg",
  //             "author": "Morgan Chittum",
  //             "slug": "US-stocks-rise-but-close-lower-for-the-week-as-investors-mull-mixed-bag-of-corporate-earnings",
  //             "memberId": "MAIN",
  //             "publishedAt": "2023-04-21T20:07:23.000Z",
  //             "createdAt": "2023-04-22T23:33:22.919Z",
  //             "updatedAt": "2023-04-22T23:33:22.919Z"
  //         },

  /// Way 1 : Complex way : Auto-parsing way :
  /// convert to Model Object by
  /// wrapping code || combine params to one obj.
  ///
  /// ex.
  /// Iterable l = json.decode(res);
  /// List<Post> posts = List<Post>.from(l.map((model)=> Post.fromJson(model)));
  ///
  @override
  Future<CcResBodyModel<ResSampleCodeFakeModel>> getList() async {
    final res = await remote.getList();

    return res.flatMapToList((m) => ResSampleCodeFakeModel.fromJson(m));
  }

  /// Way 2 : Simple way : get data by using params `data` manually
  /// @override
  /// Future<List<SampleCodeFakeModel>> getList() async {
  ///   final map = await remote.getList();
  ///
  ///   final dataObj = map[CcRestApiParams.data.name];
  ///
  ///   return List<SampleCodeFakeModel>.from(dataObj.map((e) => SampleCodeFakeModel.fromJson(e)));
  /// }

  /// Free Fake Api End point : https://mockland.dev/api/news/get-id/{id}
  ///
  /// ex. id = clgslmp1h006rvk5cjip06obz
  ///
  /// {status: {status: true, message: News fetched, code: null},
  /// data:
  /// {id: clgslmp1h006rvk5cjip06obz, title: Quella’s gorgeous retro cafe racer e-bikes are for people who don’t want to
  ///
  @override
  Future<CcResBodyModel<ResSampleCodeFakeModel>> getObj(String id) async {
    final res = await remote.getObj(id);

    return res.flatMapToList((m) => ResSampleCodeFakeModel.fromJson(m));
  }
}
