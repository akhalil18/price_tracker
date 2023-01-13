import 'package:get_it/get_it.dart';
import 'package:price_tracker/cubits/price_tracker_cubit.dart';

import '../../data/socket_service.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerFactory<SocketService>(
      () => SocketService(),
    );

    //Bloc
    sl.registerFactory(
      () => PriceTrackerCubit(sl(), sl()),
    );
  }
}
