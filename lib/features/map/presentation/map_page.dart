import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:dalil_hama/features/post/domain/params/post_get_params.dart';
import 'package:dalil_hama/features/post/domain/params/post_location_input.dart';
import 'package:dalil_hama/features/post/presentation/cubit/posts_get_cubit.dart';
import 'package:dalil_hama/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapPage extends StatefulWidget {
  static String path = "/MapPage";

  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapClusterController<Post> mapClusterController = MapClusterController<Post>(
    getPosition: (v) => LatLng(v.location!.latitude, v.location!.longitude),
    animationDuration: Duration(seconds: 1),
    identical: (a, b) =>
        LatLng(a.location!.latitude, b.location!.longitude) ==
        LatLng(b.location!.latitude, b.location!.longitude),
  );

  LatLng pos = LatLng(35.1408, 36.7553);

  List<Post> posts = [];

  final cubit = getIt<PostsGetCubit>();
  bool anim = true;

  @override
  void initState() {
    // cubit.get(
    //   params: PostGetParams(
    //     locationInput: PostLocationInput(
    //       longitude: pos.longitude,
    //       latitude: pos.latitude,
    //       radiusInM: 5000,
    //     ),
    //   ),
    // );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.translation.map)),
      body: MultiBlocListener(
        listeners: [
          BlocListener<PostsGetCubit, BasePaginatedListState<Post>>(
            bloc: cubit,
            listener: (context, state) {
              if (state.isSuccess) {
                if (anim) {
                  anim = false;
                  setState(() {});
                }
                posts.addAll(state.items);
                posts = posts.toSet().toList();
                if (posts.length != mapClusterController.data.length) {
                  mapClusterController.addPoints(posts);
                }
              }
            },
          ),
        ],
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.only(bottom: 118, left: 8, right: 8, top: 8),
          child: MapClusterWidget(
            distanceFilter: 4000,
            threshold: 10,
            maxClusterZoom: 14,
            onCameraMove: (latLng, rad) {
              // timer?.cancel();
              // timer = Timer(Duration(seconds: 1), () {
              //   mapClusterController.addPoints([]);
              cubit.get(
                params: PostGetParams(
                  locationInput: PostLocationInput(
                    longitude: latLng.longitude,
                    latitude: latLng.latitude,
                    radiusInM: rad.toDouble() + 4000,
                  ),
                ),
              );
              // });
            },
            mapClusterController: mapClusterController,
            initialLocation: pos,
            normalMarkerBuilder: (context, post) {
              return MarkerData.fromWidget(
                child: Container(
                  width: 80,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    // shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    post.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    maxLines: 1,
                  ),
                ),
                size: Size(80, 40),
              );
            },
            clusterMarkerBuilder: (context, cl) {
              return MarkerData.fromWidget(
                child: Container(
                  width: 48,
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    "cl.items.length.toString()",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                size: Size(48, 48),
              );
            },
          ),
        ),
      ),
    );
  }
}

// class _A {
//   final LatLng coord;
//   final String name;
//
//   const _A(this.name, this.coord);
// }
//
// final List<_A> hamaLocations = [
//   _A('Hama City Center', LatLng(35.140888, 36.755199)),
//   _A('Azm Palace', LatLng(35.133667, 36.752164)),
//   // ~palace center :contentReference[oaicite:1]{index=1}
//   _A('Abu\'l-Fida Mosque', LatLng(35.13953, 36.74905)),
//   // mosque on Orontes :contentReference[oaicite:2]{index=2}
//   _A('Norias of Hama', LatLng(35.13528, 36.75306)),
//   // group water-wheels :contentReference[oaicite:3]{index=3}
//   _A('Great Mosque of Hama', LatLng(35.133834, 36.740497)),
//   // west of citadel :contentReference[oaicite:4]{index=4}
//   _A('Nur al-Din Mosque', LatLng(35.1350, 36.7510)),
//   // rough near city :contentReference[oaicite:5]{index=5}
//   _A('Hama Castle (Qal‘at Ḩamāh)', LatLng(35.136272, 36.749507)),
//   _A('Orontes River (generic point)', LatLng(35.136, 36.752)),
//   _A('Hama Citadel (approx center)', LatLng(35.134, 36.749)),
//   _A('Old City Souq Area', LatLng(35.1345, 36.748)),
//   // approximate bazaar center
// ];
