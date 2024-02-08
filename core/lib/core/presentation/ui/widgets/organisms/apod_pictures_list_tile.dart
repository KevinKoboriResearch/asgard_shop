// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:nasa_apod_core/nasa_apod_core.dart';

// class ApodPicturesListTile extends StatelessWidget {
//   final PictureViewModel pictureViewModel;
//   final PicturesPagePresenter picturesPagePresenter;

//   const ApodPicturesListTile({
//     required this.pictureViewModel,
//     required this.picturesPagePresenter,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => picturesPagePresenter.pushToPictureDetails(
//           pictureViewModel.date,
//           pictureViewModel: pictureViewModel),
//       child: Container(
//         height: 180,
//         margin: const XEdgeInsets.symmetric(
//           horizontal: XSpacing.large,
//           vertical: XSpacing.semiSmall,
//         ).toEdgeInsets(context),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: CachedNetworkImageProvider(pictureViewModel.url),
//             fit: BoxFit.cover,
//           ),
//           boxShadow: [
//             BoxShadow(
//               offset: const Offset(0, 4),
//               spreadRadius: 4,
//               blurRadius: 8,
//               color: Colors.grey.shade700,
//             )
//           ],
//           borderRadius: const BorderRadius.all(Radius.circular(12)),
//         ),
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(12)),
//                   gradient: LinearGradient(
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                     stops: [0, 0.1, 0.6],
//                     colors: [
//                       Colors.black,
//                       Colors.black87,
//                       Colors.transparent,
//                     ],
//                   )),
//             ),
//             XPadding(
//               xPadding: const XEdgeInsets.symmetric(
//                 horizontal: XSpacing.medium,
//                 vertical: XSpacing.small,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   const XGap.medium(),
//                   XPadding(
//                     xPadding: const XEdgeInsets.all(XSpacing.large),
//                     child: Text(
//                       pictureViewModel.date,
//                       style: Theme.of(context).textTheme.bodyLarge,
//                       // style: const TextStyle(
//                       //   color: Colors.white,
//                       //   fontSize: 20,
//                       //   fontWeight: FontWeight.bold,
//                       //   fontFamily: 'Secular_One',
//                       // ),
//                     ),
//                   ),
//                   Text(
//                     pictureViewModel.title,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 22,
//                       fontFamily: 'Secular_One',
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
