import 'package:xml/xml.dart';

class TaxisNetAFMDetails {
  late String afm;
  late String doy;
  late String doyDescr;
  late String iniFlagDescr;
  late String deactivationFlag;
  late String deactivationFlagDescr;
  late String firmFlagDescr;
  late String onomasia;
  late String commercTitle;
  late String legalStatusDescr;
  late String postalAddress;
  late String postalAddressNo;
  late String postalZipCode;
  late String postalAreaDescription;
  late String registDate;
  late String stopDate;
  late String normalVatSystemFlag;

  TaxisNetAFMDetails.fromXmlElement(XmlElement basicRecElement) {
    afm = _getTextContent(basicRecElement, 'afm');
    doy = _getTextContent(basicRecElement, 'doy');
    doyDescr = _getTextContent(basicRecElement, 'doy_descr');
    iniFlagDescr = _getTextContent(basicRecElement, 'i_ni_flag_descr');
    deactivationFlag = _getTextContent(basicRecElement, 'deactivation_flag');
    deactivationFlagDescr =
        _getTextContent(basicRecElement, 'deactivation_flag_descr');
    firmFlagDescr = _getTextContent(basicRecElement, 'firm_flag_descr');
    onomasia = _getTextContent(basicRecElement, 'onomasia');
    commercTitle = _getTextContent(basicRecElement, 'commer_title');
    legalStatusDescr = _getTextContent(basicRecElement, 'legal_status_descr');
    postalAddress = _getTextContent(basicRecElement, 'postal_address');
    postalAddressNo = _getTextContent(basicRecElement, 'postal_address_no');
    postalZipCode = _getTextContent(basicRecElement, 'postal_zip_code');
    postalAreaDescription =
        _getTextContent(basicRecElement, 'postal_area_description');
    registDate = _getTextContent(basicRecElement, 'regist_date');
    stopDate = _getTextContent(basicRecElement, 'stop_date');
    normalVatSystemFlag =
        _getTextContent(basicRecElement, 'normal_vat_system_flag');
  }

  String _getTextContent(XmlElement element, String tagName) {
    var node = element.findElements(tagName);
    if (node.isEmpty) return '';
    return node.first.innerText.trim();
  }

  @override
  String toString() {
    return '''
AFM: $afm
DOY: $doy
DOY Description: $doyDescr
INI Flag Description: $iniFlagDescr
Deactivation Flag: $deactivationFlag
Deactivation Flag Description: $deactivationFlagDescr
Firm Flag Description: $firmFlagDescr
Onomasia: $onomasia
Commercial Title: $commercTitle
Legal Status Description: $legalStatusDescr
Postal Address: $postalAddress
Postal Address No: $postalAddressNo
Postal Zip Code: $postalZipCode
Postal Area Description: $postalAreaDescription
Registration Date: $registDate
Stop Date: $stopDate
Normal VAT System Flag: $normalVatSystemFlag
''';
  }
}
