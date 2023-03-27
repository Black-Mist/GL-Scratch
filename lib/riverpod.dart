// import 'package:calltracker/networking/riverpod/add_lead_details_provider.dart';
// import 'package:calltracker/networking/riverpod/add_lead_provider.dart';
// import 'package:calltracker/networking/riverpod/auth_provider.dart';
// import 'package:calltracker/networking/riverpod/current_country_provider.dart';
// import 'package:calltracker/networking/riverpod/enquiry_purpose_status_list_provider.dart';
// import 'package:calltracker/networking/riverpod/lead_filter_provider.dart';
// import 'package:calltracker/networking/riverpod/local_storage_provider.dart';
// import 'package:calltracker/networking/riverpod/login_provider.dart';
// import 'package:calltracker/networking/riverpod/multi_selection_dropdown_provider.dart';
// import 'package:calltracker/networking/riverpod/new_call_log_provider.dart';
// import 'package:calltracker/networking/riverpod/testing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gl_tasks/appdata/test_notifier.dart';

import 'auth_provider.dart';
import 'login_provider.dart';

final authProvider = ChangeNotifierProvider((ref) => Authentication());

final loginProvider =
    ChangeNotifierProvider((ref) => LoginProvider(ref.read(authProvider)));

final testProvider = ChangeNotifierProvider((ref) => TestNotifier());

// final currentCountryProvider =
//     ChangeNotifierProvider((ref) => CurrentCountryCodeNotifier());

// final newCallLogProvider =
//     ChangeNotifierProvider((ref) => NewCallLogNotifier());

// final localStorageProvider =
//     ChangeNotifierProvider((ref) => LocalStorageNotifier());

// final addLeadProvider = ChangeNotifierProvider((ref) => AddLeadProvider());

// final enquiryPurposeStatusListProvider =
//     ChangeNotifierProvider((ref) => EnquiryPurposeStatusListProvider());

// final addLeadDetailsProvider =
//     ChangeNotifierProvider((ref) => AddLeadDetailsNotifier());

// final enquiryFilterProvider =
//     ChangeNotifierProvider((ref) => EnquiryFilterData());

// final multiSelectionProvider =
//     ChangeNotifierProvider((ref) => MultiSelectionDropDown());

// //? Testing
// final testStorageProvider =
//     ChangeNotifierProvider((ref) => TestStorageNotifier());
