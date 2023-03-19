
import 'package:get/get.dart';
import '../../../core/utils/dami_list.dart';

class DetailsController extends GetxController {
  var id = 0;
  var getData = InformationModel();

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments['id'];
    fetchInformationItemById(id);
  }

  Future<void> fetchInformationItemById(int id) async {
    var item = await getInformationItemById(id);
    getData = item;
  }

  Future<InformationModel> getInformationItemById(int id) async {
    var list = DamiList.informationItems;
    var item = list.firstWhere((element) => element.id == id);
    return item;
  }
}