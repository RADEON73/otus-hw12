#include <iostream>
#include <string>
#include <vector>
#include <cmath>

int main() {
    std::string key;
    float price;
    std::vector<float> prices;
    float sum = 0.0;

    // First pass: read all prices and calculate mean
    while (std::cin >> key >> price) {
        prices.push_back(price);
        sum += price;
    }

    if (prices.empty()) {
        std::cout << "No data found" << std::endl;
        return 0;
    }

    float mean = sum / prices.size();
    float variance = 0.0;

    // Second pass: calculate variance
    for (float p : prices) {
        variance += (p - mean) * (p - mean);
    }
    variance /= prices.size();

    std::cout << "Price variance: " << variance << std::endl;
    return 0;
}