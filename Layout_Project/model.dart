class DataModel {
  final List<PopularLocationModel> popularLocationsData;
  final List<RecommendedModel> recommendedData;
  final List<MostViewedModel> mostViewedData;

  DataModel({
    required this.popularLocationsData,
    required this.recommendedData,
    required this.mostViewedData,
  });
}

class PopularLocationModel {
  final String locationName;
  final String image;

  PopularLocationModel({
    required this.locationName,
    required this.image,
  });
}

class RecommendedModel {
  final String image;
  final String price;
  final String hotelname;
  final String rooms;

  RecommendedModel({
    required this.image,
    required this.price,
    required this.hotelname,
    required this.rooms,
  });
}

class MostViewedModel {
  final String image;
  final String price;
  final String hotelname;
  final String rooms;

  MostViewedModel({
    required this.image,
    required this.price,
    required this.hotelname,
    required this.rooms,
  });
}
