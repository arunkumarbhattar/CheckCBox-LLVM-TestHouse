
//#include <stdlib_tainted.h>
//#include <checkcbox_extensions.h>

//typedef struct Header_masked {
//    int* twin_turbo;
//    NHDD* nested;
//}HDD_DD;
//typedef struct SuperNestedHeader_temp{
//    unsigned long brother_name;
//}SNHDD_temp;
//
//typedef struct nestedHeader_temp{
//    unsigned long  name;
//    unsigned long super_nested;
//}NHDD_temp;
//
//typedef struct Header_temp{
//    unsigned int twin_turbo;
//    unsigned int name;
//    unsigned int nested;
//}HDD_temp;
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


typedef Tstruct Header_temp{
        unsigned int car;
        unsigned int twin_turbo;
        unsigned int name;
        unsigned int nested;
        unsigned int arun;
        char c_p;
        float twin;
        float coke_float;
        unsigned int favoriteCar;
        unsigned int simpledoublepointer;
        unsigned int ulval;
        unsigned int complexdoublepointer;
}HDD_temp;

_TLIB
        _TPtr<HDD> experiment_1(void){
    return (_TPtr<HDD>)w2c_experiment_1(c_fetch_sandbox_address());
}

_TLIB
HDD_temp* experiment_2(void){
    return (HDD_temp*)w2c_experiment_1(c_fetch_sandbox_address());
}
// Driver code
_TLIB
 int main(void)
{
_TPtr<HDD> c_2 =  experiment_1();

HDD_temp* c_3 =    experiment_2();
t_printf("Val from c_2 = %d\n", (c_2));
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

