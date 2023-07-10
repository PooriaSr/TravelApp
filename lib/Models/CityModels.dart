class CityModels {
  String name;
  String location;
  String image;
  String distance;
  String temp;
  String rating;
  String description;
  int price;
  bool liked;

  CityModels(
      {required this.name,
      required this.location,
      required this.image,
      required this.distance,
      required this.temp,
      required this.rating,
      required this.description,
      required this.price,
      required this.liked});
}

List<CityModels> citiesList = [
  CityModels(
      name: "NewYork",
      location: "USA",
      image: "assets/images/newyork.jpg",
      distance: "10000",
      temp: "25",
      rating: "4.6",
      description: "USA USA USA",
      price: 3400,
      liked: false),
  CityModels(
      name: "Barcelona",
      location: "Spain",
      image: "assets/images/barcelona.jpg",
      distance: "5400",
      temp: "26",
      rating: "4.8",
      description: "Spain Spain Spain",
      price: 5100,
      liked: false),
  CityModels(
      name: "Istanbul",
      location: "Turkiye",
      image: "assets/images/istanbul.jpg",
      distance: "2000",
      temp: "24",
      rating: "4.4",
      description: "Italy Italy Italy",
      price: 1200,
      liked: false),
  CityModels(
      name: "Paris",
      location: "France",
      image: "assets/images/paris.jpg",
      distance: "5100",
      temp: "22",
      rating: "4.9",
      description: "France France France",
      price: 5600,
      liked: false),
];
