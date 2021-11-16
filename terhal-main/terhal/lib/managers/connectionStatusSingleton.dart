import 'dart:io'; //InternetAddress utility
import 'dart:async'; //For StreamController/Stream
import 'package:connectivity/connectivity.dart';

class ConnectionStatusSingleton {
  //This creates the single instance by calling the `_internal` constructor specified below
  static final ConnectionStatusSingleton _singleton =
      new ConnectionStatusSingleton._internal();
  ConnectionStatusSingleton._internal();

  //This is what's used to retrieve the instance through the app
  static ConnectionStatusSingleton getInstance() => _singleton;

  //This tracks the current connection status
  bool hasConnection = false;

  //This is how we'll allow subscribing to connection changes
  StreamController connectionChangeController =
      new StreamController.broadcast();

  //flutter_connectivity
  final Connectivity _connectivity = Connectivity();
  //Hook into flutter_connectivity's Stream to listen for changes
  //And check the connection status out of the gate
  void initialize() async {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
   var connectivityResult = await (Connectivity().checkConnectivity());
    checkConnection(connectivityResult);
  }
  Future<bool> isConnectedToInternet()async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    return checkConnection(connectivityResult);

  }

  Stream get connectionChange => connectionChangeController.stream;

  //A clean up method to close our StreamController
  //   Because this is meant to exist through the entire application life cycle this isn't
  //   really an issue
  void dispose() {
    connectionChangeController.close();
  }

  //flutter_connectivity's listener
  void _connectionChange(ConnectivityResult result) {
    checkConnection(result);
  }

  //The test to actually see if there is a connection
  Future<bool> checkConnection(ConnectivityResult connectivityResult) async {
     
  
    bool previousConnection = hasConnection;
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
     

      //The connection status changed send out an update to all listeners
    hasConnection =   await _ifConnectionHaveEnoughSpeed();
      if (previousConnection != hasConnection) {
        connectionChangeController.add(hasConnection);
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      
      //The connection status changed send out an update to all listeners
      connectionChangeController.add(hasConnection);
       hasConnection =   await _ifConnectionHaveEnoughSpeed();
      if (previousConnection != hasConnection) {
        connectionChangeController.add(hasConnection);
      }
    }else{
      hasConnection =false;
      connectionChangeController.add(false);
    }
    print(hasConnection);
    return hasConnection;
  }
  Future<bool> _ifConnectionHaveEnoughSpeed()async{
     try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          hasConnection = true;
        } else {
          hasConnection = false;
        }
      } on SocketException catch (_) {
        hasConnection = false;
      }
      return hasConnection;

  }
}
