import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';

abstract class NetworkInfo{
  Future<bool> isConnected();
}

/// Check for Internet connectivity
class NetworkInfoImpl extends NetworkInfo{
  DataConnectionChecker dataConnectionChecker;

  NetworkInfoImpl(this.dataConnectionChecker);

  @override
  Future<bool> isConnected() {
    return dataConnectionChecker.hasConnection;
  }

}