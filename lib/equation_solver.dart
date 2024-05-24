import 'dart:math';

class EquationSolver {
  static List<double> solveCubic(double a, double b, double c, double d) {
    List<double> solutions = [];

    // Normalisation des coefficients
    b /= a;
    c /= a;
    d /= a;

    // Calcul des valeurs intermédiaires
    double delta0 = b * b - 3 * c;
    double delta1 = 2 * b * b * b - 9 * b * c + 27 * d;

    // Calcul du discriminant
    double discriminant = delta1 * delta1 - 4 * delta0 * delta0 * delta0;

    if (delta0 == 0 && delta1 == 0) {
      // Tous les coefficients sont égaux, une seule racine réelle triple
      solutions.add(-b / 3);
    } else if (discriminant > 0) {
      // Une seule racine réelle et deux racines complexes
      num C = pow((delta1 + sqrt(discriminant)) / 2, 1 / 3);
      solutions.add(-1 / 3 * (b + C + delta0 / C));
    } else if (discriminant == 0) {
      // Trois racines réelles, au moins deux sont égales
      num C = pow(delta1 / 2, 1 / 3);
      solutions.add(-1 / 3 * (b + 2 * C));
      solutions.add(-1 / 3 * (b - C));
    } else {
      // Trois racines réelles distinctes
      double theta = acos(delta1 / (2 * sqrt(delta0 * delta0 * delta0)));
      solutions.add(-2 * sqrt(delta0) * cos(theta / 3) - b / 3);
      solutions.add(-2 * sqrt(delta0) * cos((theta + 2 * pi) / 3) - b / 3);
      solutions.add(-2 * sqrt(delta0) * cos((theta + 4 * pi) / 3) - b / 3);
    }

    return solutions;
  }
}
