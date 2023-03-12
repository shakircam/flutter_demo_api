

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../data/remote/drug_remote_data_source.dart';
import '../../data/remote/drug_remote_data_source_imp.dart';



class DrugRemoteSourceBindings implements Bindings {
@override
void dependencies() {
  Get.lazyPut<DrugRemoteDataSource>(
        () => DrugRemoteDataSourceImp(),
    tag: (DrugRemoteDataSource).toString(),
  );
}
}