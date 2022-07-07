import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location_repository/location_repository.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({LocationRepository? repository})
      : _repository = repository ?? LocationRepository(),
        super(LocationState.initial());

  final LocationRepository _repository;

  void getPlace(String text) async {
    List<LocationModel> list = await _repository.getPlace(text);

    emit(state.copyWith(
      locations: list,
    ));
  }

  void setLocation(String location) {
    emit(state.copyWith(
      location: location,
    ));
  }

  void removeList() {
    emit(state.copyWith(
      locations: [],
    ));
  }
}
