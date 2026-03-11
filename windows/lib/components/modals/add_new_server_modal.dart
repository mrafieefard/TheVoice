import 'package:application/client/http_client.dart';
import 'package:application/components/button.dart';
import 'package:application/components/input_text.dart';
import 'package:application/components/modals/base_modal.dart';
import 'package:application/controllers.dart';
import 'package:application/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewServerModal extends StatefulWidget {
  const AddNewServerModal({super.key});

  @override
  State<AddNewServerModal> createState() => _AddNewServerModalState();
}

class _AddNewServerModalState extends State<AddNewServerModal> {
  final serversController = Get.find<ServersController>();
  String serverAddress = "";
  bool hasError = false;
  bool isValidUrl(String value) {
    final uri = Uri.tryParse(value);

    if (uri == null) return false;
    if (!(uri.scheme == 'http' || uri.scheme == 'https')) return false;
    if (uri.host.isEmpty) return false;
    if (uri.hasPort && (uri.port < 0 || uri.port > 65535)) return false;

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseModal(
      child: Column(
        mainAxisSize:
            MainAxisSize.min, // This ensures the column only takes needed space
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Add new server",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSecondary,
            ),
          ),
          Text(
            "Enter the server address to connect to",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 16),
          if (hasError) ...[
            Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white24, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Colors.redAccent,
                        size: 18,
                      ),
                      Text("Connection Failed"),
                    ],
                  ),
                  Container(
                    height: 1,
                    color: Colors.white24,
                    margin: EdgeInsets.symmetric(vertical: 8),
                  ),
                  Text(
                    "Couldn't connect to the server, please check the address and try again",
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
          ],
          InputText(
            label: Text("Server address", style: TextStyle(fontSize: 14)),
            hintText: "https://example.com",
            onChanged: (value) {
              setState(() => serverAddress = value);
            },
          ),
          SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Server address should be like",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 8),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            margin: EdgeInsets.only(right: 8, bottom: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text("https://example.com"),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            margin: EdgeInsets.only(right: 8, bottom: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text("http://example.com:80"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        margin: EdgeInsets.only(right: 8, bottom: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text("https://example.com/thevoice"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Row(
            children: [
              Expanded(
                child: Button(
                  text: "Add Server",
                  scaleOnTap: 0.99,
                  isDisabled: !isValidUrl(serverAddress),
                  onPressed: () async {
                    try {
                      final res = await ApiRepository(
                        baseUrl: serverAddress,
                      ).api.getDefaultApi().getInformationApiInformationGet();
                      final data = res.data;
                      if (data == null)
                        throw Exception("Invalid response from server");
                      serversController.addServer(
                        SavedServer(
                          id: data.id,
                          name: data.name,
                          version: data.version,
                          serverIcon: data.serverIcon,
                          description: data.description,
                          address: serverAddress,
                        ),
                      );
                      Navigator.of(context).pop();
                    } catch (e) {
                      setState(() => hasError = true);
                      print(e);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
