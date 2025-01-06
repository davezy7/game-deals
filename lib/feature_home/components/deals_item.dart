import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_cheapshark/core/models/deals/deal_model.dart';
import 'package:riverpod_cheapshark/core/ui/components/common_image.dart';
import 'package:riverpod_cheapshark/core/utils/extensions.dart';

class DealsItem extends StatelessWidget {
  const DealsItem(this.item, {super.key, this.onItemClicked, this.itemHeight});

  final DealsModel item;
  final void Function(String movie)? onItemClicked;
  final double? itemHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onItemClicked?.call(item.dealId),
      child: SizedBox(
        height: itemHeight.orDefault(90),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          key: Key(item.dealId),
          children: [
            CommonImage(
                imageUrl: item.thumb,
                width: 150,
                height: itemHeight.orDefault(90)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    key: Key(item.title),
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$${item.normalPrice}",
                        key: Key(item.title + item.normalPrice),
                        style: GoogleFonts.poppins(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.grey,
                            fontSize: 12),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "\$${item.salePrice}",
                        key: Key(item.title + item.salePrice),
                        style: GoogleFonts.poppins(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
