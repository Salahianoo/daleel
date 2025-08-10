import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../../home/presentation/widgets/custom_app_bar.dart';
import '../../../../l10n/app_localizations.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData? _locationData;
  bool _isLoadingLocation = false;
  bool _isMapReady = false;

  // Shamsieh Education location in Jordan
  static const LatLng _shamsiehLocation = LatLng(32.0478668, 35.8922539);

  Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('shamsieh_education'),
      position: _shamsiehLocation,
      infoWindow: InfoWindow(
        title: 'Shamsieh Education',
        snippet: 'Educational Platform - Jordan, Amman',
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    // Initialize location services after a short delay to ensure widget is mounted
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _initializeLocation();
      }
    });
  }

  Future<void> _initializeLocation() async {
    // Only check location permission on mobile platforms
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      await _checkLocationPermission();
    }
  }

  Future<void> _checkLocationPermission() async {
    try {
      // First check if location services are available on this platform
      if (!await location.serviceEnabled()) {
        // Try to enable the service
        if (!await location.requestService()) {
          debugPrint('Location service could not be enabled');
          return;
        }
      }

      // Check and request permissions
      var permission = await location.hasPermission();
      if (permission == PermissionStatus.denied) {
        permission = await location.requestPermission();
        if (permission != PermissionStatus.granted) {
          debugPrint('Location permission not granted');
          return;
        }
      }

      // Update state
      _serviceEnabled = await location.serviceEnabled();
      _permissionGranted = permission;
    } catch (e) {
      // Ignore errors on unsupported platforms
      debugPrint('Location permission check failed: $e');
    }
  }

  Future<void> _getCurrentLocation() async {
    // On desktop platforms, show a message that location is not supported
    if (defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      _showLocationError(
        'Location services are not supported on desktop platforms',
      );
      return;
    }

    if (_isLoadingLocation) return; // Prevent multiple simultaneous requests

    setState(() {
      _isLoadingLocation = true;
    });

    try {
      // Double-check permissions before getting location
      await _checkLocationPermission();

      if (!_serviceEnabled) {
        _showLocationError('Location service is disabled');
        return;
      }

      if (_permissionGranted != PermissionStatus.granted) {
        _showLocationError('Location permission denied');
        return;
      }

      // Get current location with timeout
      _locationData = await location.getLocation().timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Location request timed out');
        },
      );

      if (_locationData?.latitude != null && _locationData?.longitude != null) {
        final userLocation = LatLng(
          _locationData!.latitude!,
          _locationData!.longitude!,
        );

        // Update markers in a safe way
        final newMarkers = Set<Marker>.from(_markers);
        newMarkers.removeWhere(
          (marker) => marker.markerId.value == 'user_location',
        );
        newMarkers.add(
          Marker(
            markerId: const MarkerId('user_location'),
            position: userLocation,
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueBlue,
            ),
            infoWindow: const InfoWindow(
              title: 'Your Location',
              snippet: 'Current location',
            ),
          ),
        );

        setState(() {
          _markers = newMarkers;
        });

        // Animate camera to user location
        if (_mapController != null && _isMapReady) {
          try {
            await _mapController!.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: userLocation,
                  zoom: 15,
                  bearing: 0,
                  tilt: 0,
                ),
              ),
            );
          } catch (e) {
            debugPrint('Camera animation error: $e');
          }
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Location found!'),
              backgroundColor: Color(0xFF1DD3B0),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        _showLocationError('Could not get location data');
      }
    } catch (e) {
      debugPrint('Location error: $e');
      _showLocationError('Error getting location: Please try again');
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingLocation = false;
        });
      }
    }
  }

  void _showLocationError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      final localizations = AppLocalizations.of(context)!;

      return CustomScaffold(
        body: Column(
          children: [
            // Header section
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Color(0xFF1DD3B0),
                    size: 24,
                  ),
                  Text(
                    localizations.locationInfo,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1DD3B0),
                    ),
                  ),
                ],
              ),
            ),

            // Map
            Expanded(
              child: Stack(
                children: [
                  GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      if (mounted) {
                        _mapController = controller;
                        setState(() {
                          _isMapReady = true;
                        });
                        debugPrint('Google Map initialized successfully');
                      }
                    },
                    initialCameraPosition: const CameraPosition(
                      target: _shamsiehLocation,
                      zoom: 12,
                    ),
                    markers: _markers,
                    mapType: MapType.normal,
                    zoomControlsEnabled: true,
                    compassEnabled: true,
                    myLocationButtonEnabled: false, // We'll add our own button
                    myLocationEnabled:
                        false, // Disable built-in location to avoid conflicts
                  ),
                  // Custom location button
                  Positioned(
                    right: 16,
                    bottom: 100,
                    child: FloatingActionButton(
                      onPressed: _isLoadingLocation
                          ? null
                          : () {
                              if (mounted) {
                                _getCurrentLocation();
                              }
                            },
                      backgroundColor: _isLoadingLocation
                          ? Colors.grey
                          : const Color(0xFF1DD3B0),
                      child: _isLoadingLocation
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            )
                          : const Icon(Icons.my_location, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            // Contact Information Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localizations.contactInfo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1DD3B0),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.business, size: 20, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(localizations.shamsiehEducation),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.location_on, size: 20, color: Colors.grey),
                      SizedBox(width: 8),
                      Text('Jordan, Amman'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.phone, size: 20, color: Colors.grey),
                      SizedBox(width: 8),
                      Text('+962 79 902 4000'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.school, size: 20, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(localizations.educationalPlatform),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } catch (e) {
      debugPrint('Error building MapScreen: $e');
      return CustomScaffold(
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64, color: Colors.red),
              SizedBox(height: 16),
              Text('Error loading map', style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text(
                'Please check your internet connection',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _mapController?.dispose();
    _mapController = null;
    super.dispose();
  }
}
