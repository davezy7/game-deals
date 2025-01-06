import 'package:riverpod_cheapshark/core/models/deals/deal_model.dart';
import 'package:riverpod_cheapshark/core/utils/extensions.dart';

final class GetDealsResponse {
  String? internalName;
  String? title;
  String? metacriticLink;
  String? dealId;
  String? storeId;
  String? gameId;
  String? salePrice;
  String? normalPrice;
  String? isOnSale;
  String? savings;
  String? metacriticScore;
  String? steamRatingText;
  String? steamRatingPercent;
  String? steamRatingCount;
  String? steamAppId;
  int? releaseDate;
  int? lastChange;
  String? dealRating;
  String? thumb;

  GetDealsResponse({
    this.internalName,
    this.title,
    this.metacriticLink,
    this.dealId,
    this.storeId,
    this.gameId,
    this.salePrice,
    this.normalPrice,
    this.isOnSale,
    this.savings,
    this.metacriticScore,
    this.steamRatingText,
    this.steamRatingPercent,
    this.steamRatingCount,
    this.steamAppId,
    this.releaseDate,
    this.lastChange,
    this.dealRating,
    this.thumb,
  });

  factory GetDealsResponse.fromJson(Map<String, dynamic> json) =>
      GetDealsResponse(
        internalName: json["internalName"],
        title: json["title"],
        metacriticLink: json["metacriticLink"],
        dealId: json["dealID"],
        storeId: json["storeID"],
        gameId: json["gameID"],
        salePrice: json["salePrice"],
        normalPrice: json["normalPrice"],
        isOnSale: json["isOnSale"],
        savings: json["savings"],
        metacriticScore: json["metacriticScore"],
        steamRatingText: json["steamRatingText"],
        steamRatingPercent: json["steamRatingPercent"],
        steamRatingCount: json["steamRatingCount"],
        steamAppId: json["steamAppID"],
        releaseDate: json["releaseDate"],
        lastChange: json["lastChange"],
        dealRating: json["dealRating"],
        thumb: json["thumb"],
      );

  DealsModel toModel() => DealsModel(
      internalName: internalName.orEmpty(),
      title: title.orEmpty(),
      metacriticLink: metacriticLink.orEmpty(),
      dealId: dealId.orEmpty(),
      storeId: storeId.orEmpty(),
      gameId: gameId.orEmpty(),
      salePrice: salePrice.orEmpty(),
      normalPrice: normalPrice.orEmpty(),
      isOnSale: isOnSale.orEmpty(),
      savings: savings.orEmpty(),
      metacriticScore: metacriticScore.orEmpty(),
      steamRatingText: steamRatingText.orEmpty(),
      steamRatingPercent: steamRatingPercent.orEmpty(),
      steamRatingCount: steamRatingCount.orEmpty(),
      steamAppId: steamAppId.orEmpty(),
      releaseDate: releaseDate.orZero(),
      lastChange: lastChange.orZero(),
      dealRating: dealRating.orEmpty(),
      thumb: thumb.orEmpty());
}
