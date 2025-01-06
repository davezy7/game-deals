import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_cheapshark/core/ui/components/common_loading.dart';
import 'package:riverpod_cheapshark/core/ui/components/common_reload.dart';
import 'package:riverpod_cheapshark/feature_home/components/deals_item.dart';
import 'package:riverpod_cheapshark/feature_home/notifiers/get_deals_notifier.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onBottomReached);
    Future.microtask(() async {
      ref.read(getDealsNotifier);
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onBottomReached)
      ..dispose();
    super.dispose();
  }

  void _onBottomReached() {
    if (_hasReachedBottom) {
      ref.read(getDealsNotifier.notifier).loadMorePage();
    }
  }

  bool get _hasReachedBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Today's Deals"),
      ),
      body: ref.watch(getDealsNotifier).when(
          error: (e, st) => CommonReload(
                message: e.toString(),
                onRetry: () => ref.read(getDealsNotifier),
              ),
          loading: () => const CommonLoading(message: "Fetching Data"),
          data: (deals) => deals.isNotEmpty
              ? ListView.builder(
                  itemCount: deals.length + 1,
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) => index >= deals.length
                      ? CommonLoading(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          message: "Loading more data")
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 12,
                          ),
                          child: DealsItem(deals[index]),
                        ),
                )
              : const CommonLoading(message: "Fetching Data")),
    );
  }
}
