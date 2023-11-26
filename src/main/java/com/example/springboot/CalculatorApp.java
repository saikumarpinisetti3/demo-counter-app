import static spark.Spark.*;

public class CalculatorApp {
    public static void main(String[] args) {
        staticFiles.location("/public");

        get("/", (req, res) -> {
            res.redirect("/index.html");
            return null;
        });

        post("/calculate", (req, res) -> {
            double num1 = Double.parseDouble(req.queryParams("num1"));
            double num2 = Double.parseDouble(req.queryParams("num2"));
            String operator = req.queryParams("operator");

            double result = calculate(num1, num2, operator);

            return "Result: " + result;
        });
    }

    private static double calculate(double num1, double num2, String operator) {
        switch (operator) {
            case "add":
                return num1 + num2;
            case "subtract":
                return num1 - num2;
            case "multiply":
                return num1 * num2;
            case "divide":
                if (num2 != 0) {
                    return num1 / num2;
                } else {
                    return Double.NaN; // Indicate division by zero
                }
            default:
                return Double.NaN; // Invalid operator
        }
    }
}
