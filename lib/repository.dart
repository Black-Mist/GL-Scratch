// import 'package:calltracker/models/enquiry_purpose_status_list_model.dart';
// import 'package:calltracker/models/image_model.dart';
// import 'package:calltracker/models/lead_filter.dart';
// import 'package:calltracker/models/lead_name_model.dart';
// import 'package:calltracker/models/user_model.dart';
// import 'package:calltracker/networking/api_provider/api_provider.dart';

import 'package:gl_tasks/user_model.dart';

import 'api_provider.dart';

abstract class Repository {
  // Future<List<CountryModel>>? getCountryList() {}
  Future<UserModel>? login(String username, String password) {
    return null;
  }

  Future<bool>? addLead(Map<String, dynamic> param) {
    return null;
  }
}

class AppRepository implements Repository {
  final provider = ApiProvider();

  // @override
  // Future<List<CountryModel>> getCountryList() async {
  //   final res = await provider.getData('api/countries');

  //   List<CountryModel> countryList = [];
  //   countryList = CountryList.fromJson(res).coutryList;
  //   // if (res['data'] != null) {
  //   //   // ignore: unnecessary_lambdas
  //   //   countryList = res['data'].map((e) => CountryModel.fromJson(e)).toList();
  //   // }
  //   return countryList;
  // }

  @override
  Future<UserModel>? login(String username, String password) async {
    final res = await provider.post(
      'api/agent-app/login',
      formData: {
        'username': username,
        'password': password,
      },
    );
    return UserModel.fromJson(res);
  }

  @override
  Future<bool>? addLead(Map<String, dynamic> param) async {
    final res =
        await provider.post('api/agent-app/enquiries/store', formData: param);
    return (res['status'] == 1) ? true : false;
  }
}
