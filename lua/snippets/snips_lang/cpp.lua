return {
	parse("cpm",
[[#include <bits/stdc++.h>
using  std::cout,std::cin,std::endl;

int main() {
	// your code goes here
    $1
	return 0;
}
]]),
    parse("print",
[[std::cout<< $1 <<std::endl;]])
}
