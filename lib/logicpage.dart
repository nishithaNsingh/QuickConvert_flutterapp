

const Map<String, double> conversionFactors = {
  "Millimeter(mm)": 0.001,
  "Centimeter(cm)": 0.01,
  "Meter(m)": 1.0,
  "Kilometer(km)": 1000.0,
  "Inch(in)": 0.0254,
  "Foot(ft)": 0.3048,
  "Yards(yd)": 0.9144,
  "Mile(mi)": 1609.34,
};

String convert(double inputValue, String fromUnit, String toUnit) {
  double fromFactor = conversionFactors[fromUnit]!;
  double toFactor = conversionFactors[toUnit]!;
  double meterValue = inputValue * fromFactor;
  double convertedValue = meterValue / toFactor;
  return '$inputValue $fromUnit is $convertedValue $toUnit';
}

