// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shop_app/features/udhar/presentation/providers/udhar_provider.dart';

// class UdharScreen extends ConsumerWidget {
//   const UdharScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(udharNotifierProvider);

//     return Container(
//       color: const Color(0xffF5F7FB),
//       child: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           children: [
//             // ================= HEADER =================
//             Row(
//               children: [
//                 const Text(
//                   "Udhar Khata",
//                   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                 ),

//                 const Spacer(),

//                 SizedBox(
//                   width: 320,
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: "Search customer...",
//                       prefixIcon: const Icon(Icons.search),
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(14),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 24),

//             // ================= SUMMARY =================
//             Row(
//               children: [
//                 _summaryCard(
//                   title: "Pending Customers",
//                   value: "24",
//                   icon: Icons.people_alt_outlined,
//                 ),

//                 const SizedBox(width: 16),

//                 _summaryCard(
//                   title: "Total Pending",
//                   value: "Rs. 45,000",
//                   icon: Icons.account_balance_wallet_outlined,
//                 ),

//                 const SizedBox(width: 16),

//                 _summaryCard(
//                   title: "Bills Pending",
//                   value: "120",
//                   icon: Icons.receipt_long_outlined,
//                 ),
//               ],
//             ),

//             const SizedBox(height: 28),

//             // ================= LIST =================
//             Expanded(
//               child: state.when(
//                 data: (data) {
//                   if (data.isEmpty) {
//                     return const Center(
//                       child: Text(
//                         "No Pending Udhar",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     );
//                   }

//                   return ListView.separated(
//                     itemCount: data.length,
//                     separatorBuilder: (_, __) => const SizedBox(height: 14),
//                     itemBuilder: (context, index) {
//                       final item = data[index];

//                       return InkWell(
//                         borderRadius: BorderRadius.circular(20),
//                         onTap: () {
//                           // open detail screen
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.all(20),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20),
//                             boxShadow: [
//                               BoxShadow(
//                                 blurRadius: 12,
//                                 color: Colors.black.withOpacity(.04),
//                                 offset: const Offset(0, 4),
//                               ),
//                             ],
//                           ),

//                           child: Row(
//                             children: [
//                               // avatar
//                               CircleAvatar(
//                                 radius: 28,
//                                 backgroundColor: Colors.blue.shade50,
//                                 child: Text(
//                                   item.customerName[0],
//                                   style: TextStyle(
//                                     fontSize: 22,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.blue.shade700,
//                                   ),
//                                 ),
//                               ),

//                               const SizedBox(width: 18),

//                               // info
//                               Expanded(
//                                 flex: 3,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       item.customerName,
//                                       style: const TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),

//                                     const SizedBox(height: 6),

//                                     Text(
//                                       item.mobileNumber,
//                                       style: TextStyle(
//                                         color: Colors.grey.shade600,
//                                       ),
//                                     ),

//                                     const SizedBox(height: 4),

//                                     Text(
//                                       item.address,
//                                       style: TextStyle(
//                                         color: Colors.grey.shade500,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),

//                               // date
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "Last Activity",
//                                       style: TextStyle(
//                                         color: Colors.grey.shade600,
//                                       ),
//                                     ),

//                                     const SizedBox(height: 6),

//                                     const Text(
//                                       "24 Jul 2026",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),

//                               // bills
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "Pending Bills",
//                                       style: TextStyle(
//                                         color: Colors.grey.shade600,
//                                       ),
//                                     ),

//                                     const SizedBox(height: 6),

//                                     const Text(
//                                       "12 Bills",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),

//                               // amount
//                               Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 18,
//                                   vertical: 12,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: Colors.red.shade50,
//                                   borderRadius: BorderRadius.circular(14),
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       "Pending",
//                                       style: TextStyle(
//                                         color: Colors.red.shade400,
//                                         fontSize: 12,
//                                       ),
//                                     ),

//                                     const SizedBox(height: 4),

//                                     Text(
//                                       "Rs. ${item.totalPendingAmount}",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 18,
//                                         color: Colors.red.shade700,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },

//                 loading: () => const Center(child: CircularProgressIndicator()),

//                 error: (e, _) => Center(
//                   child: Text(
//                     e.toString(),
//                     style: const TextStyle(color: Colors.red),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _summaryCard({
//     required String title,
//     required String value,
//     required IconData icon,
//   }) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.all(22),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(18),
//           boxShadow: [
//             BoxShadow(
//               blurRadius: 10,
//               color: Colors.black.withOpacity(.04),
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             Icon(icon, size: 34),

//             const SizedBox(width: 16),

//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title, style: TextStyle(color: Colors.grey.shade600)),

//                 const SizedBox(height: 8),

//                 Text(
//                   value,
//                   style: const TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
