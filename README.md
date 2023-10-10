This package uses [Αναζήτηση Βασικών Στοιχείων Μητρώου Επιχειρήσεων](https://www.aade.gr/epiheiriseis/forologikes-ypiresies/mitroo/anazitisi-basikon-stoiheion-mitrooy-epiheiriseo])
to request and parse the respone from TAXISnet API.

## Features

- Get TaxisNetAFMDetails
```dart
class TaxisNetAFMDetails {
   String afm;
   String doy;
   String doyDescr;
   String iniFlagDescr;
   String deactivationFlag;
   String deactivationFlagDescr;
   String firmFlagDescr;
   String onomasia;
   String commercTitle;
   String legalStatusDescr;
   String postalAddress;
   String postalAddressNo;
   String postalZipCode;
   String postalAreaDescription;
   String registDate;
   String stopDate;
   String normalVatSystemFlag;
}
```

## Getting started

To get credentials for using this API follow the steps [here](https://www.aade.gr/epiheiriseis/forologikes-ypiresies/mitroo/anazitisi-basikon-stoiheion-mitrooy-epiheiriseon)

## Usage

```dart
final client = TaxisNetAFMClient('Kodikos_eisodou', 'Synthimatiko');
client.getAFMDetails('090165560').then((value) => print(value));

// output:
// AFM: 090165560
// DOY: 1104
// DOY Description: Δ ΑΘΗΝΩΝ
// INI Flag Description: ΜΗ ΦΠ
// Deactivation Flag: 1
// Deactivation Flag Description: ΕΝΕΡΓΟΣ ΑΦΜ
// Firm Flag Description: ΕΠΙΤΗΔΕΥΜΑΤΙΑΣ
// Onomasia: ΥΠΟΥΡΓΕΙΟ ΟΙΚΟΝΟΜΙΚΩΝ ΓΕΝΙΚΗ   ΔIEYΘΥΝΣΗ  Δ ΚΗΣΥΠ ΞΗΣ Δ ΟΙΚ
// Commercial Title:
// Legal Status Description: ΔΗΜΟΣΙΑ ΥΠΗΡΕΣΙΑ
// Postal Address: Κ ΣΕΡΒΙΑΣ
// Postal Address No: 10
// Postal Zip Code: 10110
// Postal Area Description: ΑΘΗΝΑ
// Registration Date: 1993-02-08
// Stop Date:
// Normal VAT System Flag: N
```
