import 'dart:developer';
import 'package:aimshala/models/career_counsel_model/career_bookingtime_model.dart';
import 'package:aimshala/models/career_counsel_model/counsel_booking_check_model.dart';
import 'package:aimshala/models/career_counsel_model/search_aim_res_model.dart';
import 'package:aimshala/services/career_counsell_services/check_counsell_booking_service.dart';
import 'package:aimshala/services/career_counsell_services/get_aim_service.dart';
import 'package:aimshala/services/career_counsell_services/get_booking_date_time_service.dart';
import 'package:aimshala/services/career_counsell_services/slot_booking_save_service.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_aim_screen/widgets/model/microaim_model.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_review_booking_screen/widgets/booking_dialoguebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class BookCareerCounsellController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController otherRoleController = TextEditingController();
  TextEditingController aimController = TextEditingController();
  TextEditingController mobNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  RxList<MicroModel> check = <MicroModel>[].obs;
  RxList<Aim> searchAimRes = <Aim>[].obs;
  RxList<Aim> filteredAims = <Aim>[].obs;
  RxList<Slot> times = <Slot>[].obs;

  RxString selectedDate = RxString('');
  String? selectedTime;
  RxString isBooked = ''.obs;
  CounselCallBookedModel? counselBookedModel;

  RxBool isLoading = false.obs;
  RxBool isSaving = false.obs;

  /*------------ Get Aim option search result ---------*/
  Future<void> searchAimOptions({required String query}) async {
    try {
      isLoading.value = true;
      searchAimRes.value =
          await CareerAimService().getAimSearchResult(query: query);
    } finally {
      isLoading.value = false;
    }
  }

  void searchAims(String query) {
    if (query.isEmpty) {
      filteredAims.value = searchAimRes;
    } else {
      final filteredData = searchAimRes.where((search) {
        final aimName = search.name?.toLowerCase();
        final searchQuery = query.toLowerCase();
        return aimName!.contains(searchQuery);
      }).toList();
      filteredAims.value = filteredData;
    }
  }

/*------------ Get Aim option search result ---------*/
  // Future<RxList<MicroAim>> searchMicroAimOptions(
  //     {required String query, required String parentId}) async {
  //   isLoading.value = true;
  //   searchMicorAimRes.value = await CareerAimService()
  //       .getMicroAimSearchResult(query: query, parentId: parentId);
  //   // log(searchMicorAimRes.toString(), name: 'micro aim search');
  //   isLoading.value = false;
  //   return searchMicorAimRes;
  // }

/*---------- Career fetch booking date ---------*/
  Future<List?> fetchBookingDate() async {
    final List<dynamic>? dates = await CareerBookingService().getBookingDate();
    if (dates != null && dates.isNotEmpty && selectedDate.value.isEmpty) {
      selectedDate.value = dates[0].toString();
      update();
    }
    return dates;
  }

/*---------- Career fetch booking time ---------*/
  Future<RxList<Slot>> fetchBookingTime({required String date}) async {
    await Future.delayed(const Duration(seconds: 1));
    times.value = await CareerBookingService().getBookingTime(date: date);
    update();
    return times;
  }

  /*------------ save career counsill slot ---------*/
  Future<void> careerBokingSlotSaveFucntion({
    required String name,
    required String appointDate,
    required String appointTime,
    required List<String> microAim,
  }) async {
    try {
      String? token = await storage.read(key: 'token');
      isSaving.value = true;
      // await Future.delayed(Duration(seconds: 2));
      String? slote = await SlotBookingService().slotBooking(
        token: token.toString(),
        appointDate: appointDate,
        appointTime: appointTime,
        microAim: microAim,
      );
      if (slote == "Slot Booked successfully") {
        Get.showSnackbar(
          GetSnackBar(
            snackStyle: SnackStyle.FLOATING,
            message: slote,
            borderRadius: 4,
            margin: const EdgeInsets.all(10),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
        showDialog(
          barrierDismissible: false,
          context: Get.context!,
          builder: (context) {
            checkCounsellcallBookingFuntion();
            return BookingDialogueBox(userName: name);
          },
        );
      } else {
        Get.showSnackbar(
          GetSnackBar(
            snackStyle: SnackStyle.FLOATING,
            message: slote,
            borderRadius: 4,
            margin: const EdgeInsets.all(10),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 2),
          ),
        );
      }
      isSaving.value = false;
    } finally {
      isSaving.value = false;
    }
  }

  Future<void> checkCounsellcallBookingFuntion() async {
    String? token = await storage.read(key: 'token');

    Map<String, dynamic>? data = await CheckCounsellBookingService()
        .checkCounsellcallBooking(token: token.toString());
    log(data.toString(), name: 'check counsell booking taken');
    if (data != null) {
      if (data['Booking Status'] == 'Not Booked') {
        isBooked.value = 'no';
        // log(isBooked.value, name: 'iscounsell booked');
      } else if (data['Booking Status'] == 'Upcoming') {
        isBooked.value = 'yes';
        counselBookedModel = CounselCallBookedModel.fromJson(data);
      }
    }
  }

  String? aimValidation(String? word) {
    if (word == null || word.isEmpty) {
      return 'Please select atleast one Aim';
    }
    return null;
  }
}







  // List<Category>? aimRes;
  // List<SubCategory>? microaimRes;

  /*------------ Get Aim options ---------*/
  // Future<List<Category>?> getAimOptions() async {
  //   aimRes = await CareerAimService().getAimService();
  //   // CareerAimService().getAimSearchResult(query: 'med');
  //   update();
  //   return aimRes;
  //   // return null;
  // }

  // /*------------ Get Micro Aim options ---------*/
  // Future<List<SubCategory>?> getMicroAimOptions({required String aimId}) async {
  //   microaimRes = await CareerAimService().getMicroAim(aimId: aimId);
  //   log(microaimRes![0].categoryName.toString(), name: 'controller');
  //   update();
  //   return microaimRes;
  // }
  
  