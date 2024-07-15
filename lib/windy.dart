class Windy {
  Windy({
    required this.api,
    required this.request,
    required this.response,
    required this.errorResponse,
  });

  final Api? api;
  final Request? request;
  final Response? response;
  final ErrorResponse? errorResponse;

  factory Windy.fromJson(Map<String, dynamic> json) {
    return Windy(
      api: json["api"] == null ? null : Api.fromJson(json["api"]),
      request:
          json["request"] == null ? null : Request.fromJson(json["request"]),
      response:
          json["response"] == null ? null : Response.fromJson(json["response"]),
      errorResponse: json["errorResponse"] == null
          ? null
          : ErrorResponse.fromJson(json["errorResponse"]),
    );
  }
}

class Api {
  Api({
    required this.name,
    required this.version,
    required this.endpoint,
    required this.method,
  });

  final String? name;
  final String? version;
  final String? endpoint;
  final String? method;

  factory Api.fromJson(Map<String, dynamic> json) {
    return Api(
      name: json["name"],
      version: json["version"],
      endpoint: json["endpoint"],
      method: json["method"],
    );
  }
}

class ErrorResponse {
  ErrorResponse({
    required this.code,
    required this.message,
  });

  final int? code;
  final String? message;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      code: json["code"],
      message: json["message"],
    );
  }
}

class Request {
  Request({
    required this.lat,
    required this.lon,
    required this.model,
    required this.parameters,
    required this.levels,
    required this.key,
  });

  final double? lat;
  final double? lon;
  final String? model;
  final List<String> parameters;
  final List<String> levels;
  final String? key;

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      lat: json["lat"],
      lon: json["lon"],
      model: json["model"],
      parameters: json["parameters"] == null
          ? []
          : List<String>.from(json["parameters"]!.map((x) => x)),
      levels: json["levels"] == null
          ? []
          : List<String>.from(json["levels"]!.map((x) => x)),
      key: json["key"],
    );
  }
}

class Response {
  Response({
    required this.ts,
    required this.units,
    required this.windUSurface,
    required this.windVSurface,
    required this.tempSurface,
    required this.precipSurface,
    required this.cloudsSurface,
    required this.windU850H,
    required this.windV850H,
    required this.temp850H,
    required this.windU500H,
    required this.windV500H,
    required this.temp500H,
  });

  final List<int> ts;
  final Units? units;
  final List<double> windUSurface;
  final List<double> windVSurface;
  final List<double> tempSurface;
  final List<double> precipSurface;
  final List<int> cloudsSurface;
  final List<double> windU850H;
  final List<double> windV850H;
  final List<double> temp850H;
  final List<double> windU500H;
  final List<double> windV500H;
  final List<double> temp500H;

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      ts: json["ts"] == null ? [] : List<int>.from(json["ts"]!.map((x) => x)),
      units: json["units"] == null ? null : Units.fromJson(json["units"]),
      windUSurface: json["wind_u-surface"] == null
          ? []
          : List<double>.from(json["wind_u-surface"]!.map((x) => x)),
      windVSurface: json["wind_v-surface"] == null
          ? []
          : List<double>.from(json["wind_v-surface"]!.map((x) => x)),
      tempSurface: json["temp-surface"] == null
          ? []
          : List<double>.from(json["temp-surface"]!.map((x) => x)),
      precipSurface: json["precip-surface"] == null
          ? []
          : List<double>.from(json["precip-surface"]!.map((x) => x)),
      cloudsSurface: json["clouds-surface"] == null
          ? []
          : List<int>.from(json["clouds-surface"]!.map((x) => x)),
      windU850H: json["wind_u-850h"] == null
          ? []
          : List<double>.from(json["wind_u-850h"]!.map((x) => x)),
      windV850H: json["wind_v-850h"] == null
          ? []
          : List<double>.from(json["wind_v-850h"]!.map((x) => x)),
      temp850H: json["temp-850h"] == null
          ? []
          : List<double>.from(json["temp-850h"]!.map((x) => x)),
      windU500H: json["wind_u-500h"] == null
          ? []
          : List<double>.from(json["wind_u-500h"]!.map((x) => x)),
      windV500H: json["wind_v-500h"] == null
          ? []
          : List<double>.from(json["wind_v-500h"]!.map((x) => x)),
      temp500H: json["temp-500h"] == null
          ? []
          : List<double>.from(json["temp-500h"]!.map((x) => x)),
    );
  }
}

class Units {
  Units({
    required this.temp,
    required this.wind,
    required this.precip,
    required this.clouds,
  });

  final String? temp;
  final String? wind;
  final String? precip;
  final String? clouds;

  factory Units.fromJson(Map<String, dynamic> json) {
    return Units(
      temp: json["temp"],
      wind: json["wind"],
      precip: json["precip"],
      clouds: json["clouds"],
    );
  }
}
