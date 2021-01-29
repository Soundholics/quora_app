import 'package:flutter/foundation.dart';

/// The Class which is used to capture and transfer any API Interaction and handle data accordingly in the project.
///
/// [success] defines the state of request, can only be either [true] or [false]
///
/// [error] can contain message [String] only if [success] returns [false] else should always be an empty string
///
/// [data] can contain any kind of data that is obtained from the API response object.
/// data is stored only if [success] results in [true]   
class ApiResponse {
  final bool success;
  final String error;
  final dynamic data;

  ApiResponse({@required this.success, this.error, this.data})
      : assert(success != null);
  
  static bool isMapParsble(Map<String, dynamic> map){
    return map.containsKey("success") && map.containsKey("error") && map.containsKey("data");
  }
}
