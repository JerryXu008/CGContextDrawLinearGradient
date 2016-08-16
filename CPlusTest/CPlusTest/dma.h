//
//  dma.h
//  CPlusTest
//
//  Created by song on 15/2/28.
//  Copyright (c) 2015年 song. All rights reserved.
//

#ifndef __CPlusTest__dma__
#define __CPlusTest__dma__

#include <stdio.h>
#include <iostream>

class baseDMA{
private:
    char *label;
    int rating;
public:
    baseDMA(const char *l="null",int r=0);
    baseDMA(const baseDMA &rs);
    virtual ~baseDMA();
    baseDMA & operator=(const baseDMA&rs);
    friend std::ostream &operator<<(std::ostream &os,const baseDMA&rs);

};

class lacksDMA:public baseDMA{

private:
    enum{COL_LEN=40};
    char color[COL_LEN];
public:
    lacksDMA(const char *c="blank",const char *l="null",int r=0);
    lacksDMA(const char *c,const baseDMA&rs);
    friend std::ostream &operator<<(std::ostream &os,const lacksDMA &rs);
};

class hasDMA:public baseDMA{

private:
    char *style;
public:
    hasDMA(const char *s="none",const char *l="null",int r=0);
    hasDMA(const char *s,const baseDMA&rs);
    hasDMA(const hasDMA&hs);
    ~hasDMA();
    hasDMA &operator=(const hasDMA&rs);
    friend std::ostream & operator<<(std::ostream &os,const hasDMA &rs);
};


#endif /* defined(__CPlusTest__dma__) */
