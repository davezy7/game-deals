import 'package:dio/dio.dart';
import 'package:riverpod_cheapshark/api_deals/entities/response/get_deals_response.dart';
import 'package:riverpod_cheapshark/api_deals/sources/deals_remote_source.dart';

final class DealsRemoteSourceImpl implements DealsRemoteSource {
  final Dio _client;

  DealsRemoteSourceImpl({required Dio client}) : _client = client;

  @override
  Future<List<GetDealsResponse>> getDeals(int pageNumber) async {
    try {
      final response = await _client.get("/deals",
          queryParameters: {'pageNumber': pageNumber, 'pageSize': 30});
      return (response.data as List)
          .map((d) => GetDealsResponse.fromJson(d))
          .toList();
    } on DioException {
      rethrow;
    }
  }
}
