//
//  ViewController.m
//  CPlusTest
//
//  Created by song on 15/2/12.
//  Copyright (c) 2015年 song. All rights reserved.
//

#import "ViewController.h"
#include <iostream>

#import "test.h"
#include <vector>
#include <array>
#include "string1.h"
#include "worker0.h"
#include "TestMI.h"
#include <valarray>
#include "studentc.h"
using namespace std;


namespace HEHE {
    int wenqian;
    struct AA{
        int i;
    };
 
}
class AAA{
    public :
    void add();
private:
    int aa;

};

//extern int waibu;

#include <new> // for placement new
const int BUF = 512;

char buffer[BUF];      // chunk of memory


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    using namespace std;
    using namespace HEHE;
    
    
    {
        
        
       
        
        
        
        
        
        
        
        
        
        //vv.backgroundColor=[UIColor redColor];
        
        
//        Waiter bob{"ffff",33,5};
//        Singer bev("fsfsdf",33,6);
//        Waiter w_temp;
//        Singer s_temp;
//        
//        Worker *pw[4]={&bob,&bev,&w_temp,&s_temp};
        
//        D dd;
//        dd.get();
//        
//        valarray<int>ff;
        
        
        //   StringBad headline1("AAA");
////   StringBad headline2("BBB");
//    StringBad sports("CCC");
    
        //std::cout<<&headline2<<endl;
    
    
//    callme1(headline1);
//    cout << "headline1: " << headline1 << endl;
//   callme2(headline2);
//   cout << "headline2: " << headline2 << endl;
//    
    
    
//    cout << "Initialize one object to another:\n";
//    StringBad sailor = sports;
//
//  cout << "sailor: " << sailor << endl;
//    cout << "Assign one object to another:\n";
//   StringBad knot;
//   knot = headline1;
//   cout << "knot: " << knot << endl;
//    cout << "Exiting the block.\n";
        
    
    }
}

void callme1(StringBad & rsb)
{
    cout << "String passed by reference:\n";
    cout << "    \"" << rsb << "\"\n";
}

void callme2(StringBad sb)
{
//    cout<<&sb<<endl;
    //cout << "String passed by value:\n";
    cout << "    \"" << sb << "\"\n";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
