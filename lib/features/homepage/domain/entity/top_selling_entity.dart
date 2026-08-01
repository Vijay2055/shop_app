class TopSellingEntity {
  final String variantId;
  final String productName;
  final String sku;
  final int quantitySold;
  final double revenue;
  final double profit;

  const TopSellingEntity({
    required this.variantId,
    required this.productName,
    required this.sku,
    required this.quantitySold,
    required this.revenue,
    required this.profit,
  });
}