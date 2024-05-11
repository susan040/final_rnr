import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/controllers/dashboard/home_controller.dart';
import 'package:rent_and_ride/models/vehicle.dart';
import 'package:rent_and_ride/utils/colors.dart';
import 'package:rent_and_ride/views/single_vehicle.dart';

class MySearchDelegate extends SearchDelegate {
  final c = Get.find<HomePageController>();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: c.fetchVehicleItem(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            itemCount: c.fetchVehicleList.length,
            itemBuilder: (context, index) {
              Vehicle vehicle = c.fetchVehicleList[index];
              return Material(
                elevation: 2.0,
                child: ListTile(
                  tileColor: Colors.white,
                  title: Text(
                    vehicle.vehicleName!,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(vehicle.vendor!.name ?? ""),
                  leading: CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(vehicle.imageUrl ?? ""),
                  ),
                  trailing: Text(
                    "Rs ${vehicle.costPerHour.toString()}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.primaryColor),
                  ),
                  onTap: () {
                    Get.to(() => SinglePage(vehicle: vehicle));
                  },
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Center(
                child: Text(
                  "",
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
          );
        } else if (c.fetchVehicleList == []) {
          return const SizedBox(
            height: 2,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    c.search.value = query;
    return query == ""
        ? ListView.builder(
            itemCount: c.vehicleList.length < 3 ? c.vehicleList.length : 4,
            itemBuilder: (context, index) {
              Vehicle vehicle = c.vehicleList[index];
              return ListTile(
                title: Text(vehicle.vehicleName ?? ""),
                onTap: () {
                  Get.to(() => SinglePage(vehicle: vehicle));
                },
              );
            })
        : ListView.builder(
            itemCount: c.vehicleList.length > 3 ? 3 : c.vehicleList.length,
            itemBuilder: (context, index) {
              Vehicle vehicle = c.vehicleList[index];
              return ListTile(
                title: Text(vehicle.vehicleName ?? ""),
                onTap: () {
                  showResults(context);
                },
              );
            },
          );
  }
}
