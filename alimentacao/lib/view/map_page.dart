import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import '../components.dart';


class PickUpLocationScreen extends StatefulWidget {
  const PickUpLocationScreen({super.key});

  @override
  State<PickUpLocationScreen> createState() => _PickUpLocationScreenState();
}

class _PickUpLocationScreenState extends State<PickUpLocationScreen> {
  final MapController _mapController = MapController(
    initMapWithUserPosition: true
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components.appBar("Doação", backgroundColor: Components.colorLightPurple),
      bottomNavigationBar: Container(
        color: Components.colorPurple,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Components.uiButton("Confirmar", Colors.white, () { Navigator.pop(context); }, textColor: Components.colorPurple)
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 120,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Components.colorPurple,
                height: 120,
                width: double.infinity,
                child: Center(
                  child: Components.h1("Pontos de coleta", color: Colors.white, textAlign: TextAlign.center)
                )
              ),
              Expanded(
                child: OSMFlutter(
                  controller: _mapController,
                  mapIsLoading: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  trackMyPosition: true,
                  initZoom: 12,
                  minZoomLevel: 2,
                  maxZoomLevel: 19,
                  stepZoom: 2,
                  //androidHotReloadSupport: true,
                  roadConfiguration: const RoadOption(
                    roadColor: Color(0xff000000)
                  ),
                  markerOption: MarkerOption(
                    defaultMarker: const MarkerIcon(
                      icon: Icon(Icons.person_pin_circle_outlined)
                    )
                  ),
                  userLocationMarker: UserLocationMaker(
                    personMarker: const MarkerIcon(
                      icon: Icon(
                        Icons.personal_injury_outlined,
                        color: Color(0xff000000),
                        size: 48,
                      ),
                    ),
                    directionArrowMarker: const MarkerIcon(
                      icon: Icon(
                        Icons.location_on_outlined,
                        color: Color(0xff000000),
                        size: 48,
                      )
                    ),
                  ),
                  onMapIsReady: (isReady) async {
                    if (isReady) {
                      await Future.delayed(const Duration(seconds: 1), () async { 
                        await _mapController.currentLocation(); 
                      });
                    }
                  },
                ),
              )
            ],
          )
        ),
      )
    );
  }
}