import 'package:riverpod_cheapshark/api_deals/entities/response/get_deals_response.dart';

abstract class DealsRemoteSource {
  Future<List<GetDealsResponse>> getDeals(int pageNumber);
}
