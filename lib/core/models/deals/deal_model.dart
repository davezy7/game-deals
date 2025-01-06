class DealsModel {
  String internalName;
  String title;
  String metacriticLink;
  String dealId;
  String storeId;
  String gameId;
  String salePrice;
  String normalPrice;
  String isOnSale;
  String savings;
  String metacriticScore;
  String steamRatingText;
  String steamRatingPercent;
  String steamRatingCount;
  String steamAppId;
  int releaseDate;
  int lastChange;
  String dealRating;
  String thumb;

  DealsModel({
    required this.internalName,
    required this.title,
    required this.metacriticLink,
    required this.dealId,
    required this.storeId,
    required this.gameId,
    required this.salePrice,
    required this.normalPrice,
    required this.isOnSale,
    required this.savings,
    required this.metacriticScore,
    required this.steamRatingText,
    required this.steamRatingPercent,
    required this.steamRatingCount,
    required this.steamAppId,
    required this.releaseDate,
    required this.lastChange,
    required this.dealRating,
    required this.thumb,
  });

  DealsModel copyWith({
    String? internalName,
    String? title,
    String? metacriticLink,
    String? dealId,
    String? storeId,
    String? gameId,
    String? salePrice,
    String? normalPrice,
    String? isOnSale,
    String? savings,
    String? metacriticScore,
    String? steamRatingText,
    String? steamRatingPercent,
    String? steamRatingCount,
    String? steamAppId,
    int? releaseDate,
    int? lastChange,
    String? dealRating,
    String? thumb,
  }) =>
      DealsModel(
        internalName: internalName ?? this.internalName,
        title: title ?? this.title,
        metacriticLink: metacriticLink ?? this.metacriticLink,
        dealId: dealId ?? this.dealId,
        storeId: storeId ?? this.storeId,
        gameId: gameId ?? this.gameId,
        salePrice: salePrice ?? this.salePrice,
        normalPrice: normalPrice ?? this.normalPrice,
        isOnSale: isOnSale ?? this.isOnSale,
        savings: savings ?? this.savings,
        metacriticScore: metacriticScore ?? this.metacriticScore,
        steamRatingText: steamRatingText ?? this.steamRatingText,
        steamRatingPercent: steamRatingPercent ?? this.steamRatingPercent,
        steamRatingCount: steamRatingCount ?? this.steamRatingCount,
        steamAppId: steamAppId ?? this.steamAppId,
        releaseDate: releaseDate ?? this.releaseDate,
        lastChange: lastChange ?? this.lastChange,
        dealRating: dealRating ?? this.dealRating,
        thumb: thumb ?? this.thumb,
      );
}
