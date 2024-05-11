import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/controllers/dashboard/home_controller.dart';
import 'package:rent_and_ride/controllers/dashboard/search_controller.dart';
import 'package:rent_and_ride/utils/colors.dart';
import 'package:rent_and_ride/views/single_vehicle.dart';
import 'package:rent_and_ride/widgets/custom_text_style.dart';

import '../models/vehicle.dart';
import '../utils/image_paths.dart';
import '../widgets/search.dart';

class ExplorePage extends StatelessWidget {
  static const routeName = "/explore-page";
  ExplorePage({super.key});

  final c = Get.find<HomePageController>();
  final con = Get.put(SearchScreenController());
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.tertiary,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: theme.colorScheme.secondary,
            ),
          ),
        ),
        title: Text(
          "Explore",
          style: theme.textTheme.bodyLarge!
              .copyWith(fontSize: 16, color: theme.colorScheme.secondary),
        ),
        centerTitle: false,
      ),
      body: Obx(
        () => (c.loading.value)
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: SizedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        child: Row(
                          children: [
                            Container(
                              width:
                                  ((MediaQuery.of(context).size.width) * 0.74),
                              height:
                                  ((MediaQuery.of(context).size.height) * 0.06),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(19)),
                              child: TextButton(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    Text(
                                      "Search",
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  showSearch(
                                    context: context,
                                    delegate: MySearchDelegate(),
                                  );
                                },
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                con.advanceSearch();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Container(
                                  width: ((MediaQuery.of(context).size.width) *
                                      0.1),
                                  height:
                                      ((MediaQuery.of(context).size.height) *
                                          0.06),
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Icon(
                                      CupertinoIcons.slider_horizontal_3),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      c.vehicleList.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 25,
                                ),
                                Center(
                                  child: SvgPicture.asset(
                                    ImagePath.noVehicle,
                                    height: 300,
                                    width: 200,
                                  ),
                                ),
                                const SizedBox(
                                  height: 53,
                                ),
                                const Text(
                                  "No Available Vehicle",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            )
                          : Container(
                              height: Get.height - 210,
                              margin: const EdgeInsets.only(top: 1),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: ListView.builder(
                                itemCount: c.vehicleList.length,
                                itemBuilder: (context, index) {
                                  Vehicle vehicles = c.vehicleList[index];
                                  return RecentVehicleCard(
                                    vehicles: vehicles,
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class RecentVehicleCard extends StatelessWidget {
  const RecentVehicleCard({
    Key? key,
    required this.vehicles,
  }) : super(key: key);

  final Vehicle vehicles;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 19, top: 20),
      child: InkWell(
        onTap: () {
          Get.to(
            () => SinglePage(
              vehicle: vehicles,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.extraWhiteColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(4, 4),
                blurRadius: 9,
                color: AppColors.shadowColor,
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 3,
                  bottom: 3,
                  left: 10,
                  right: 12,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: vehicles.imageUrl!,
                    height: 87,
                    width: 94,
                    errorWidget: (context, url, error) => Image.asset(
                      ImagePath.logo,
                      height: 87,
                      width: 94,
                      fit: BoxFit.fill,
                    ),
                    // height: 87,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      vehicles.vehicleName ?? "",
                      style: CustomTextStyles.f14W600(
                          color: AppColors.primaryColor),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Cost Per hour: ${vehicles.costPerHour.toString()}',
                      style: CustomTextStyles.f14W600(
                          color: AppColors.primaryColor),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      vehicles.vehicleDescription ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.f14W400(),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
