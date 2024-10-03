import 'model.dart';

class DataViewModel {
  static DataModel createSampleData() {
    return DataModel(
      popularLocationsData: [
        PopularLocationModel(locationName: "India", image: "images/india.jpg"),
        PopularLocationModel(
            locationName: "Moscow", image: "images/Moscow.jpg"),
        PopularLocationModel(
            locationName: "USA", image: "images/statue-of-liberty.jpg"),
        PopularLocationModel(
            locationName: "Canada", image: "images/shwezigon.jpg"),
        PopularLocationModel(locationName: "China", image: "images/china.jpg"),
      ],
      recommendedData: [
        RecommendedModel(
            image: "images/house-1.jpg",
            price: "\$120/Night",
            hotelname: "Hotel California",
            rooms: "Private rooms / 4 beds"),
        RecommendedModel(
            image: "images/large-home-2.jpg",
            price: "\$400/Night",
            hotelname: "Sunset Hotel",
            rooms: "Private rooms / 8 beds"),
        RecommendedModel(
            image: "images/house-3.jpg",
            price: "\$600/Night",
            hotelname: "Sunset Hotel",
            rooms: "Private rooms / 2 beds"),
        RecommendedModel(
            image: "images/residence-4.jpg",
            price: "\$300/Night",
            hotelname: "Sunset Hotel",
            rooms: "Private rooms / 10 beds"),
        RecommendedModel(
            image: "images/house-5.jpg",
            price: "\$250/Night",
            hotelname: "Sunset Hotel",
            rooms: "Private rooms / 6 beds"),
      ],
      mostViewedData: [
        MostViewedModel(
            image: "images/House3@3x.png",
            price: "\$300",
            hotelname: "Luxury Inn",
            rooms: "Private rooms / 4beds"),
        MostViewedModel(
            image: "images/resort-1.jpg",
            price: "\$100",
            hotelname: "Budget Stay",
            rooms: "Private rooms / 5beds"),
        MostViewedModel(
            image: "images/pool-house.jpg",
            price: "\$100",
            hotelname: "Budget Stay",
            rooms: "Private rooms / 8beds"),
      ],
    );
  }
}
