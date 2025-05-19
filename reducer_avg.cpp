#include <iostream>
#include <string>
#include <map>

int main() {
    std::string key;
    float price;
    float sum = 0.0;
    int count = 0;

    while (std::cin >> key >> price) {
        sum += price;
        count++;
    }

    if (count > 0) {
        float average = sum / count;
        std::cout << "Average price: " << average << std::endl;
    }
    else {
        std::cout << "No data found" << std::endl;
    }

    return 0;
}