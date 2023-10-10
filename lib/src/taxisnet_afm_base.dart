import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:taxisnet_afm/src/models/taxis_net_afm_details_model.dart';
import 'package:xml/xml.dart';

class TaxisNetAFMClient {
  final String _username;
  final String _password;

  final String _soapEndpoint =
      'https://www1.gsis.gr/wsaade/RgWsPublic2/RgWsPublic2';

  final Map<String, String> _headers = {
    HttpHeaders.contentTypeHeader: 'application/soap+xml;charset=utf-8',
    'SOAPAction': 'POST',
  };

  TaxisNetAFMClient(this._username, this._password);

  Future<TaxisNetAFMDetails?> getAFMDetails(String afm) async {
    final response = await http
        .post(
          Uri.parse(_soapEndpoint),
          headers: _headers,
          body: _generateSoapXml(afm),
        )
        .then<String?>(
          (resp) => resp.body,
          onError: (e) => null,
        );
    if (response == null) return null;
    final document = XmlDocument.parse(response);

    // check for errors
    final errors = document.findAllElements('error_descr');
    if (errors.isNotEmpty) {
      for (final error in errors) {
        final hasNullError = error.getAttribute('xsi:nil') == 'true';
        if (!hasNullError) throw Exception(error.innerText);
      }
    }

    final basicRecElements = document.findAllElements('basic_rec');
    if (basicRecElements.isEmpty) return null;
    return TaxisNetAFMDetails.fromXmlElement(basicRecElements.first);
  }

  String _generateSoapXml(String afm) {
    return '''
      <env:Envelope xmlns:env="http://www.w3.org/2003/05/soap-envelope" xmlns:ns1="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" xmlns:ns2="http://rgwspublic2/RgWsPublic2Service" xmlns:ns3="http://rgwspublic2/RgWsPublic2">
         <env:Header>
            <ns1:Security>
               <ns1:UsernameToken>
                  <ns1:Username>$_username</ns1:Username>
                  <ns1:Password>$_password</ns1:Password>
               </ns1:UsernameToken>
            </ns1:Security>
         </env:Header>
         <env:Body>
            <ns2:rgWsPublic2AfmMethod>
               <ns2:INPUT_REC>
                  <ns3:afm_called_by/>
                  <ns3:afm_called_for>$afm</ns3:afm_called_for>
               </ns2:INPUT_REC>
            </ns2:rgWsPublic2AfmMethod>
         </env:Body>
      </env:Envelope>
   ''';
  }
}
