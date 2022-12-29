#include <fstream>
#include <iostream>
#include <ostream>
#include <string.h>
#include <math.h>
#include <string>

#define PI 3.14

int main(int argc, char* argv[]){
    
    int width = atoi(argv[1]);// 149
    int height = atoi(argv[2]); // 39
    int f = atoi(argv[3]);//[0, 360]
    

    int bw = 79;
    int bh = 15;

    double dr = 2 - (cos(PI * f/ 180) + 1);
    
    int w = width - bw;
    int h = height - bh;

    // std::cout << w << ' ' << h << ' ' << std::endl;

    int col_w = (double) f / 360 * w;
    int col_h = (double) dr / 2 * h;
    
    // std::cout << width << ' ' << height << std::endl;
    // std::cout << col_w << ' ' << col_h << std::endl;
    

    for(int i = 0; i < col_h; i++){
        std::cout << std::endl;
    }

    std::ifstream file("ani/batascii.txt");
    std::string s = "";
    while(std::getline(file, s)){
        for(int i = 0; i < col_w; i++){
            std::cout << " ";
        }
        std::cout << s << std::endl;
    }
    for(int i = 0; i < 39; i++){
        std::cout << std::endl;
    }

    // std::ifstream file("ani/batascii.txt");
    // std::string s = "";
    // while(std::getline(file, s)){
    //     std::cout << s << std::endl;
    // }
    
    return 0;
}
