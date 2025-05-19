#include <iostream>
#include <string>
#include <sstream>

int main() {
    std::string line;
    while (std::getline(std::cin, line)) {
        // Skip header line if present
        if (line.find("id,name,host_id,host_name") != std::string::npos) {
            continue;
        }

        std::stringstream ss(line);
        std::string token;
        int column = 0;
        float price = 0.0;

        // Extract price which is the 9th column (index 8)
        while (std::getline(ss, token, ',')) {
            if (column == 9) { // price column
                try {
                    price = std::stof(token);
                }
                catch (...) {
                    price = 0.0; // handle invalid price values
                }
                break;
            }
            column++;
        }

        // Emit key-value pair: "price" and the actual price value
        std::cout << "price\t" << price << "\n";
    }
    return 0;
}