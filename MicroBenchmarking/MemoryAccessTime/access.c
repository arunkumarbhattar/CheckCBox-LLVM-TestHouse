#include <checkcbox_extensions.h>
extern double w2c_MemoryAccessInLoop();

double MemoryAccessInLoop()
{
    return w2c_MemoryAccessInLoop(c_fetch_sandbox_address());
}
int main() {

    printf("CPU time used in Sandbox is %f \n", MemoryAccessInLoop());
    return 0;

}
