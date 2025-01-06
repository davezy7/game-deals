import 'package:riverpod_cheapshark/core/models/deals/deal_model.dart';

abstract class DealsRepository {
  Future<List<DealsModel>> getDeals(int pageNumber);
}
