import 'package:flutter/material.dart';


class SearchProductWithBarcodeField extends StatefulWidget {
  const SearchProductWithBarcodeField({super.key, required this.onScan});
  final Future<void> Function(String barcode) onScan;

  @override
  State<SearchProductWithBarcodeField> createState() =>
      _SearchProductWithBarcodeFieldState();
}

class _SearchProductWithBarcodeFieldState
    extends State<SearchProductWithBarcodeField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool isProcessing = false;

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleScan(String value) async {
    if (isProcessing || value.trim().isEmpty) return;

    setState(() => isProcessing = true);

    final barcode = value.trim();

    await widget.onScan(barcode);
    _reset();
  }

  void _reset() {
    _controller.clear();
    _focusNode.requestFocus();
    setState(() => isProcessing = false);
  }

 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        autofocus: true,

        /// 🔥 Trigger scan
        onSubmitted: _handleScan,

        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.qr_code_scanner),
          hintText: "Scan barcode...",

          /// ⏳ Loading indicator
          suffixIcon: isProcessing
              ? const Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : null,

          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
