part of 'location_cubit.dart';

class LocationState extends Equatable {
  const LocationState._(
      {this.location = '', this.loading = false, required this.locations});

  LocationState.initial() : this._(locations: []);

  final String location;
  final bool loading;
  final List<LocationModel> locations;

  LocationState copyWith({
    String? location,
    bool? loading,
    List<LocationModel>? locations,
  }) {
    return LocationState._(
      location: location ?? this.location,
      loading: loading ?? this.loading,
      locations: locations ?? this.locations,
    );
  }

  @override
  List<Object> get props => [location, loading, locations];
}
