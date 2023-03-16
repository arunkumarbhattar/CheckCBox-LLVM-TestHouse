#include <stdlib_tainted.h>
#include <checkcbox_extensions.h>
#include <string_tainted.h>
void w2c_dblptr(void*, unsigned int);
void somefucntion(_TPtr<_TPtr<char>> basic){
    return w2c_dblptr(c_fetch_sandbox_address(), (int)basic);
}

 int main(void)
{
    _Decoy _TPtr<_TPtr<char>> basic = (_TPtr<_TPtr<char>>)t_malloc(3*sizeof(_TPtr<char>));
    const char* mainBih = NULL;
    basic[0] = (_TPtr<char>)t_malloc(100*sizeof(char));
    t_strcpy(basic[0], "Hello World");
    basic[1] = (_TPtr<char>)t_malloc(100*sizeof(char));
    t_strcpy(basic[1], "Hello Supercharger");
    basic[2] = (_TPtr<char>)t_malloc(100*sizeof(char));
    t_strcpy(basic[2], "Hello Turbocharger");
    t_printf("First is %s \n", basic[0]);
    t_printf("Second is %s \n", basic[1]);
    t_printf("Third is %s \n", basic[2]);

    somefucntion(basic);
    return 0;
}

