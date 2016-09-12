//
//  main.c
//  CProject
//
//  Created by Bolu on 15/4/11.
//  Copyright (c) 2015年 Bolu. All rights reserved.
//

#include <stdio.h>

int func(int argc, const char * argv[]) {
    // insert code here...
    void (^blk)(void) = ^ {
        printf("Hello, Block!\n");
    };
    blk();
    return 0;
}
