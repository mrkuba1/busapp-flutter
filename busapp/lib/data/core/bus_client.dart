import 'package:busapp/data/busstops/models/busstopsinfo.dart';
import 'package:busapp/data/core/bus_client_path.dart';
import 'package:busapp/data/lines/models/busstoplines.dart';
import 'package:busapp/data/timetables/models/busroutes.dart';
import 'package:http/http.dart';

class BusClient {
  Future<BusstopLines> getBusstopLines(String busstopID, String busstopIDsmall) async {
    final response = await get(BusClientPath.busstopsline.getUriBus(busstopID, busstopIDsmall));

    return BusstopLines.fromJson(response.body);
  }
  Future<BusstopsInfo> getBusstopsInfo() async{
    final response = await get(BusClientPath.busstopinfo.getUriBusInfo());

    return BusstopsInfo.fromJson(response.body);
  }
  Future<Busroutes> getBusRoutes(String busstopID, String busstopIDsmall, String line) async{
    final response = await get(BusClientPath.timetables.getUriRoute(busstopID, busstopIDsmall, line));

    return Busroutes.fromJson(response.body);
  }
}