import 'package:flutter/material.dart';
import 'package:rentall/data_view_model.dart';
import 'model.dart';

class SearchApp extends StatelessWidget {
  const SearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  late DataModel dataModel;

  // Combined List of all searchable content
  List<dynamic> searchableData = [];

  @override
  void initState() {
    super.initState();
    dataModel = DataViewModel.createSampleData();
    searchableData = [
      ...dataModel.popularLocationsData,
      ...dataModel.recommendedData,
      ...dataModel.mostViewedData,
    ];
  }

  List<dynamic> filteredData = [];

  void _filterItems(String query) {
    List<dynamic> results = [];
    if (query.isEmpty) {
      results = searchableData;
    } else {
      results = searchableData.where((item) {
        if (item is PopularLocationModel) {
          return item.locationName.toLowerCase().contains(query.toLowerCase());
        } else if (item is RecommendedModel) {
          return item.hotelname.toLowerCase().contains(query.toLowerCase());
        } else if (item is MostViewedModel) {
          return item.hotelname.toLowerCase().contains(query.toLowerCase());
        }
        return false;
      }).toList();
    }

    setState(() {
      filteredData = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Serach',
            border: InputBorder.none,
            fillColor: Color(0xFF131313),
          ),
          onChanged: _filterItems,
        ),
      ),
      body: ListView.builder(
        itemCount: filteredData.length,
        itemBuilder: (context, index) {
          final item = filteredData[index];
          if (item is PopularLocationModel) {
            return ListTile(
              leading: Image.asset(item.image), // Placeholder for images
              title: Text(item.locationName),
              subtitle: Text('Popular Location'),
            );
          } else if (item is RecommendedModel) {
            return ListTile(
              leading: Image.asset(item.image),
              title: Text(item.hotelname),
              subtitle:
                  Text('${item.price} - ${item.rooms} rooms (Recommended)'),
            );
          } else if (item is MostViewedModel) {
            return ListTile(
              leading: Image.asset(item.image),
              title: Text(item.hotelname),
              subtitle:
                  Text('${item.price} - ${item.rooms} rooms (Most Viewed)'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
