import 'dart:io';

Future<bool> checkRealInternetConnection() async {
  try {
    // Try connecting to Google's DNS server with a 3-second timeout
    final socket = await Socket.connect('8.8.8.8', 53, timeout: const Duration(seconds: 3));
    
    // If we get here, connection was successful
    socket.destroy(); // Always close the socket when done
    return true;
  } catch (_) {
    // A SocketException or TimeoutException means no internet
    return false; 
  }
}
