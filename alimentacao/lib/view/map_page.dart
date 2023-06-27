import 'package:alimentacao/model/pickup_point.dart';
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
    initMapWithUserPosition: false,
    initPosition: GeoPoint(
      latitude: -23.59167,
      longitude: -48.05306
    )
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
            child: Components.quickText("Selecione um ponto de coleta", fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white, textAlign: TextAlign.center)
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
                  onGeoPointClicked: (point) {
                    PickUpPoint? pickUpPoint = PickUpPoint.getByLatLng(point.latitude, point.longitude);
                    showModalBottomSheet(
                      context: context, 
                      builder: (context) {
                        return SizedBox(
                          height: 500,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      const Icon(
                                        Icons.pin_drop_rounded,
                                        size: 150,
                                        color: Components.colorPurple,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                        child: Components.quickText("${pickUpPoint!.roadName}, ${pickUpPoint.number}", fontSize: 24, fontWeight: FontWeight.w700, color: Components.colorPurple, textAlign: TextAlign.center),
                                      ),
                                      Components.quickText(pickUpPoint.neighborhood, fontSize: 24, fontWeight: FontWeight.w700, color: Components.colorPurple, textAlign: TextAlign.center),
                                      Components.quickText(pickUpPoint.city, fontSize: 24, fontWeight: FontWeight.w700, color: Components.colorPurple, textAlign: TextAlign.center),
                                    ],
                                  ),
                                  Components.uiButton(
                                    "Selecionar", 
                                    Components.colorPurple, 
                                    () {
                                      Navigator.pop(context);
                                      Navigator.pop(context, pickUpPoint.id);
                                    }
                                  )
                                ],
                              ),
                            )
                          ),
                        );
                      },
                    );
                  },
                  staticPoints: [
                    StaticPositionGeoPoint(
                      '0', 
                      const MarkerIcon(
                        icon: Icon(
                          Icons.pin_drop_rounded,
                          size: 100,
                          color: Components.colorPurple,
                        )
                      ),
                      PickUpPoint.getAll()
                    )
                  ],
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