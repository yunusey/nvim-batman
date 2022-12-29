#include <fstream>
#include <iostream>
#include <ostream>
#include <string.h>
#include <math.h>
#include <string>

#define PI 3.14

int main(int argc, char* argv[]){
    
    std::ifstream file("batascii.txt");
    std::string s = "";
    while(std::getline(file, s)){
        std::cout << s << std::endl;
    }
    
    return 0;
}
