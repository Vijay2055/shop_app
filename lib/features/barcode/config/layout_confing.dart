import 'package:shop_app/core/utils/constants.dart';

class BarcodeLayoutConfig {
  final int columns;
  final int rows;

  final double widthMm;
  final double heightMm;

  const BarcodeLayoutConfig({
    required this.columns,
    required this.rows,
    required this.widthMm,
    required this.heightMm,
  });
}

BarcodeLayoutConfig getLayoutConfig(
  BarcodeLayout layout,
) {
  switch (layout) {
    case BarcodeLayout.single:
      return const BarcodeLayoutConfig(
        columns: 1,
        rows: 1,
        widthMm: 100,
        heightMm: 50,
      );

    case BarcodeLayout.a4_12:
      return const BarcodeLayoutConfig(
        columns: 3,
        rows: 4,
        widthMm: 63.5,
        heightMm: 72,
      );

    case BarcodeLayout.a4_24:
      return const BarcodeLayoutConfig(
        columns: 4,
        rows: 6,
        widthMm: 63.5,
        heightMm: 33.9,
      );

    case BarcodeLayout.a4_48:
      return const BarcodeLayoutConfig(
        columns: 6,
        rows: 8,
        widthMm: 48,
        heightMm: 25,
      );

    case BarcodeLayout.a4_80:
      return const BarcodeLayoutConfig(
        columns: 8,
        rows: 10,
        widthMm: 38,
        heightMm: 19,
      );
  }
}