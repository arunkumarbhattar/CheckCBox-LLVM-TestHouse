
#include <stdlib_tainted.h>
#include <checkcbox_extensions.h>

typedef Tstruct ExtremelyNestedHeader{
    float coke_float;
    _TArray_ptr<char> favoriteCar;
}ENHDD;


typedef Tstruct SuperNestedHeader{
_TPtr<char> brother_name;
int arun;
char c_p;
float twin;

}SNHDD;

typedef Tstruct nestedHeader{
_TPtr<char> name;
_TPtr<SNHDD> super_nested;
int arun;
char c_p;
float twin;

}NHDD;

typedef Tstruct Header{
int car;
	_TPtr<int> twin_turbo;
_TPtr<char> name;
_TPtr<NHDD> nested;
int arun;
char c_p;
float twin;
ENHDD ED;
_TPtr<_TPtr<char>> simpledoublepointer;
unsigned int ulval;
_TPtr<_TPtr<NHDD>> complexdoublepointer;
}HDD;

typedef _Decoy Tstruct Spl_ExtremelyNestedHeader{
        float coke_float;
        unsigned int favoriteCar;
}Spl_ENHDD;

Spl_ENHDD Spl_ExtremelyNestedHeader_var;

typedef _Decoy Tstruct Spl_SuperNestedHeader{
        unsigned int brother_name;
        unsigned int arun;
        char c_p;
        float twin;
}Spl_SNHDD;


Spl_SNHDD Spl_SuperNestedHeader_var;

typedef _Decoy Tstruct Spl_nestedHeader{
        unsigned int name;
        unsigned int super_nested;
        unsigned int arun;
        char c_p;
        float twin;

}Spl_NHDD;

Spl_NHDD Spl_nestedHeader_var;

typedef _Decoy Tstruct Spl_Header{
        unsigned int car;
        unsigned int twin_turbo;
        unsigned int name;
        unsigned int nested;
        int arun;
        char c_p;
        float twin;
        Spl_ENHDD ED;
        unsigned int simpledoublepointer;
        unsigned int ulval;
        unsigned int complexdoublepointer;
} Spl_HDD;

Spl_HDD Spl_Header_var;

_TLIB
        Spl_HDD dummy_1(void){
    return Spl_Header_var;
}

_TLIB
Spl_NHDD dummy_2(void){
    return Spl_nestedHeader_var;
}
_TLIB
Spl_SNHDD dummy_3(void){
    return Spl_SuperNestedHeader_var;
}

_TLIB
Spl_ENHDD dummy_4(void){
    return Spl_ExtremelyNestedHeader_var;
}

_TLIB
        _TPtr<HDD> experiment_1(void){
    return (_TPtr<HDD>)w2c_experiment_1(c_fetch_sandbox_address());
}

_TLIB
        _TPtr<HDD> experiment_2(_TPtr<HDD> hdd_val){
    return (_TPtr<HDD>)w2c_experiment_2(c_fetch_sandbox_address(), hdd_val);
}
_TLIB
 int main(void)
{
_TPtr<HDD> c_2 =  experiment_1();
    c_2 =  experiment_2(c_2);
   t_printf("Val from c_2->twin_turbo = %d\n", *(c_2->twin_turbo));
      t_printf("Val from c_2->name  = %s\n", (c_2->name));
    t_printf("Val from c_2->nested->name  = %s\n", (c_2->nested->name));
    t_printf("Val from c_2->ulval  = %u\n", (c_2->ulval));
    t_printf("Val from c_2->complexdoublepointer[0]->name  = %s\n", (c_2->complexdoublepointer[0]->name));
    t_printf("Val from c_2->complexdoublepointer[1]->name  = %s\n", (c_2->complexdoublepointer[1]->name));

    t_printf("Val from c_2->nested->super_nested->brother_name  = %s\n", (c_2->nested->super_nested->brother_name));

    t_printf("Val from c_2->arun  = %d\n", (c_2->arun));
    t_printf("Val from c_2->c_p  = %c\n", (c_2->c_p));
    t_printf("Val from c_2->arun  = %f\n", (c_2->twin));
    t_printf("Val from c_2->ED,coke_float  = %f\n", (c_2->ED.coke_float));
    t_printf("Val from c_2->ED.favoriteCar  = %s\n", (c_2->ED.favoriteCar));
    t_printf("Val from c_2->simpledoublepointer[0]  = %s\n", (c_2->simpledoublepointer[0]));
    t_printf("Val from c_2->simpledoublepointer[1]  = %s\n", (c_2->simpledoublepointer[1]));


    t_printf("Val from c_2->simpledoublepointer[2]  = %s\n", (c_2->simpledoublepointer[2]));

    t_printf("Val from c_2->nested->arun  = %d\n", (c_2->nested->arun));
    t_printf("Val from c_2->nested->c_p  = %c\n", (c_2->nested->c_p));
    t_printf("Val from c_2->nested->arun  = %f\n", (c_2->nested->twin));

    t_printf("Val from c_2->nested->super_nested->arun  = %d\n", (c_2->nested->super_nested->arun));
    t_printf("Val from c_2->nested->super_nested->c_p  = %c\n", (c_2->nested->super_nested->c_p));
    t_printf("Val from c_2->nested->super_nested->arun  = %f\n", (c_2->nested->super_nested->twin));

    return 0;
}

