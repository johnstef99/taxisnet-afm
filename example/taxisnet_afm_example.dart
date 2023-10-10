import 'package:taxisnet_afm/taxisnet_afm.dart';

const username = String.fromEnvironment('TAXISNET_USERNAME');
const password = String.fromEnvironment('TAXISNET_PASSWORD');

void main() {
  final client = TaxisNetAFMClient(username, password);
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
}
