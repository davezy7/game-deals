import 'package:dio/dio.dart';
import 'package:riverpod_cheapshark/api_deals/repositories/deals_repository.dart';
import 'package:riverpod_cheapshark/api_deals/sources/deals_remote_source.dart';
import 'package:riverpod_cheapshark/core/models/deals/deal_model.dart';

final class DealsRepositoryImpl implements DealsRepository {
  final DealsRemoteSource _remoteSource;
  DealsRepositoryImpl({required DealsRemoteSource remoteSource})
      : _remoteSource = remoteSource;

  @override
  Future<List<DealsModel>> getDeals(int pageNumber) async {
    try {
      final deals = await _remoteSource.getDeals(pageNumber);
      return deals.map((e) => e.toModel()).toList();
    } on DioException {
      rethrow;
    }
  }
}
