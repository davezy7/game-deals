import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_cheapshark/api_deals/repositories/deals_repository.dart';
import 'package:riverpod_cheapshark/api_deals/repositories/deals_repository_impl.dart';
import 'package:riverpod_cheapshark/api_deals/sources/deals_remote_source.dart';
import 'package:riverpod_cheapshark/api_deals/sources/deals_remote_source_impl.dart';
import 'package:riverpod_cheapshark/core/providers/core_provider.dart';

final dealsRemoteSourceProvider = Provider<DealsRemoteSource>(
    (ref) => DealsRemoteSourceImpl(client: ref.read(dioProvider)));

final dealsRepositoryProvider = Provider<DealsRepository>((ref) =>
    DealsRepositoryImpl(remoteSource: ref.read(dealsRemoteSourceProvider)));
