import 'package:ppid_mobile/modules/home/models/berita_ppid/berita_ppid.dart';
import 'package:ppid_mobile/modules/home/models/berita_uin/berita_uin.dart';

class HomeBerita {
  static List<BeritaPpid> _listPpid = [];
  static List<BeritaUin> _listUin = [];

  void setPpid(List<BeritaPpid> list) {
    _listPpid = list;
  }

  List<BeritaPpid> getPpid() {
    return _listPpid;
  }

  void setUin(List<BeritaUin> list) {
    _listUin = list;
  }

  List<BeritaUin> getUin() {
    return _listUin;
  }
}
