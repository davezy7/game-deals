import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_cheapshark/api_deals/providers/deals_providers.dart';
import 'package:riverpod_cheapshark/core/models/deals/deal_model.dart';
import 'package:riverpod_cheapshark/core/utils/extensions.dart';

final getDealsNotifier =
    AsyncNotifierProvider.autoDispose<GetDealsNotifier, List<DealsModel>>(
        GetDealsNotifier.new);

final class GetDealsNotifier
    extends AutoDisposeAsyncNotifier<List<DealsModel>> {
  int _pageNumber = 1;
  bool _isLoadingNewPage = false;
  final List<DealsModel> _dealList = List.empty(growable: true);

  @override
  FutureOr<List<DealsModel>> build() async {
    _getDeals();
    return _dealList;
  }

  Future<void> _getDeals() async {
    if (_dealList.isEmpty) state = const AsyncLoading();
    try {
      final deals =
          await ref.read(dealsRepositoryProvider).getDeals(_pageNumber);
      _dealList.addAll(deals.distinctBy((e) => e.gameId));
      state = AsyncData(_dealList);
      _isLoadingNewPage = false;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      _isLoadingNewPage = false;
    }
  }

  Future<void> loadMorePage() async {
    if (_isLoadingNewPage) return;
    _isLoadingNewPage = true;
    _pageNumber++;
    _getDeals();
  }
}
