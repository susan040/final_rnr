import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/controllers/dashboard/home_controller.dart';
import 'package:rent_and_ride/models/category.dart';
import '../../utils/colors.dart';
import '../../utils/image_paths.dart';
import '../../widgets/custom_button.dart';

class SearchScreenController extends GetxController {
  final homeController = Get.put(HomePageController());
  final RxList<bool> isExpanded1 = RxList.generate(3, (index) => false);
  final RxList<bool> checkboxSortByValues = RxList.filled(2, false);
  // final RxList<bool> checkboxSeatValues = RxList.filled(5, false);
  RxBool loading = false.obs;

  int selectedIndex = -1; // Initially, no checkbox is selected

  RxInt category = 0.obs;
  // var vehicleCategory = [].obs;

  var selectedIds = <int>{}.obs;

  final RxList<bool> checkboxTypeValues = RxList.filled(5, false);

  void toggleSelection(int id) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
      homeController.vehicleCategory.refresh();
    } else {
      selectedIds.add(id);
      homeController.vehicleCategory.refresh();
    }
  }

  final selectedOption = 'Any'.obs;
  
  advanceSearch() {
    showModalBottomSheet(
      backgroundColor: AppColors.backGroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(45.0),
        ),
      ),
      isScrollControlled: true,
      context: Get.context!,
      builder: ((context) {
        // final theme =
        //     Theme.of(context).copyWith(dividerColor: Colors.transparent);
        return Obx(
          () => SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 5,
                    width: 105,
                    decoration: BoxDecoration(
                      color: AppColors.borderColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(ImagePath.cancel)),
                      const Text(
                        "Filter By",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ExpandablePanel(
                        header: const ListTile(
                          title: Text(
                            'Sort by Price',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor),
                          ),
                        ),
                        collapsed: Container(),
                        expanded: Column(
                          children: [
                            CheckboxListTile(
                              title: const Text('Default'),
                              activeColor: AppColors.primaryColor,
                              value: selectedOption.value == 'Any',
                              onChanged: (bool? value) {
                                selectedOption.value = 'Any';
                              },
                            ),
                            CheckboxListTile(
                              title: const Text('Ascending'),
                              activeColor: AppColors.primaryColor,
                              value: selectedOption.value == 'ascending',
                              onChanged: (bool? value) {
                                selectedOption.value =
                                    value == true ? 'ascending' : 'Any';
                              },
                            ),
                            CheckboxListTile(
                              activeColor: AppColors.primaryColor,
                              title: const Text('Descending'),
                              value: selectedOption.value == 'descending',
                              onChanged: (bool? value) {
                                selectedOption.value =
                                    value == true ? 'descending' : 'Any';
                              },
                            ),
                          ],
                        ),
                      ),
                      ExpandablePanel(
                        header: const ListTile(
                          title: Text(
                            'Type',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor),
                          ),
                        ),
                        expanded: ListView.builder(
                          shrinkWrap: true,
                          itemCount: homeController.vehicleCategory.length,
                          itemBuilder: (BuildContext context, int index) {
                            VehicleCategory item =
                                homeController.vehicleCategory[index];
                            return CheckboxListTile(
                              activeColor: selectedIds.contains(item.id)
                                  ? AppColors.primaryColor
                                  : null,
                              title: Text(item.name ?? ""),
                              value: selectedIds.contains(item.id),
                              onChanged: (val) {
                                toggleSelection(item.id!);
                                homeController.vehicleCategory.refresh();
                                selectedIds.refresh();
                              },
                            );
                          },
                        ),
                        collapsed: Container(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomElevatedButton(
                        onTap: () {
                          String sortyBy = selectedOption.value;
                          homeController.getAllVehicleList(
                              sortyBy, selectedIds.toList());
                          Navigator.pop(context);
                        },
                        buttonText: "Done",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ])),
          ),
        );
      }),
    );
  }
}

titileText(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  );
}

optionText(String text) {
  return Text(
    text,
    style: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
  );
}
