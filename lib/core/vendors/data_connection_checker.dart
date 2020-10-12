import 'package:data_connection_checker/data_connection_checker.dart';

abstract class DataConnectChecker {
  Future<bool> isConnect();
}

class DataConnectCheckerImpl implements DataConnectChecker {
  final DataConnectionChecker connectionChecker;

  const DataConnectCheckerImpl(this.connectionChecker);

  @override
  Future<bool> isConnect() {
    return this.connectionChecker.hasConnection;
  }
}
