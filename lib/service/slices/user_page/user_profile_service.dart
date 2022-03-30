import 'package:qingyuo_mobile/service/slices/user_page/common/common.dart';
import 'package:qingyuo_mobile/utils/callbacks.dart';

class UserProfileSliceService {
  queryUserInfo(AfterQueryUserInfoSuccess success) {
    String table = 'userinfo';
    Common().getDbService(table, (e) async {
      var data = await e.query(table, columns: ['uname', 'sex', 'signature', 'id', 'avatar']);
      success(data[0]);
    });
  }
}
