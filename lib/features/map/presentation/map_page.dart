import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/presentation/utils/ext/tr.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  static String path = "/MapPage";

  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapClusterController<_A> mapClusterController = MapClusterController<_A>(
    getPosition: (v) => v.coord,
    animationDuration: Duration(seconds: 1),
    identical: (a, b) => a.coord == b.coord,
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((e) {
      mapClusterController.addPoints(hamaLocations);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.translation.map)),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: MapClusterWidget(
          mapClusterController: mapClusterController,
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
                child: Text(cl.items.length.toString() , style: TextStyle(fontSize: 22),),
              ),
              size: Size(48, 48),
            );
          },
        ),
      ),
    );
  }
}

class _A {
  final LatLng coord;
  final String name;

  const _A(this.name, this.coord);
}

final List<_A> hamaLocations = [
  _A('Hama City Center', LatLng(35.140888, 36.755199)),
  _A('Azm Palace', LatLng(35.133667, 36.752164)),
  // ~palace center :contentReference[oaicite:1]{index=1}
  _A('Abu\'l-Fida Mosque', LatLng(35.13953, 36.74905)),
  // mosque on Orontes :contentReference[oaicite:2]{index=2}
  _A('Norias of Hama', LatLng(35.13528, 36.75306)),
  // group water-wheels :contentReference[oaicite:3]{index=3}
  _A('Great Mosque of Hama', LatLng(35.133834, 36.740497)),
  // west of citadel :contentReference[oaicite:4]{index=4}
  _A('Nur al-Din Mosque', LatLng(35.1350, 36.7510)),
  // rough near city :contentReference[oaicite:5]{index=5}
  _A('Hama Castle (Qal‘at Ḩamāh)', LatLng(35.136272, 36.749507)),
  _A('Orontes River (generic point)', LatLng(35.136, 36.752)),
  _A('Hama Citadel (approx center)', LatLng(35.134, 36.749)),
  _A('Old City Souq Area', LatLng(35.1345, 36.748)),
  // approximate bazaar center
];
