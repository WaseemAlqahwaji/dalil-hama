import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:dalil_hama/features/post/domain/entity/post.dart';
import 'package:dalil_hama/features/post/domain/params/post_get_params.dart';
import 'package:dalil_hama/features/post/domain/params/post_location_input.dart';
import 'package:dalil_hama/features/post/presentation/cubit/posts_get_cubit.dart';
import 'package:dalil_hama/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
            onItemTap: (v) {
              context.push("/PostDetailsPage/${v.id}");
            },
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
                    cl.items.length.toString(),
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
