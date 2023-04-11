#include "bug.h"
typedef _Tainted Tstruct quantum_reg_node_struct
{
COMPLEX_FLOAT amplitude; /* alpha_j */
MAX_UNSIGNED state;      /* j */
}quantum_reg_node;

_Decoy _Tainted Tstruct Spl_quantum_reg_node_struct
        {
                unsigned int amplitude; /* alpha_j */
                unsigned int state;      /* j */
        };

typedef _Tainted Tstruct quantum_reg_struct
{
int width;    /* number of qubits in the qureg */
int size;     /* number of non-zero vectors */
int hashw;    /* width of the hash array */
_TPtr<quantum_reg_node> node;
_TPtr<int> hash;
}quantum_reg;

_Decoy _Tainted Tstruct Spl_quantum_reg_struct
        {
                int width;    /* number of qubits in the qureg */
                int size;     /* number of non-zero vectors */
                int hashw;    /* width of the hash array */
                unsigned int node;
                unsigned int hash;
        };

static Tstruct Spl_quantum_reg_node_struct Spl_quantum_reg_node_Val;
static Tstruct Spl_quantum_reg_struct Spl_quantum_reg_Val;

_TLIB static
        Tstruct Spl_quantum_reg_node_struct
Dummy_Spl_quantum_reg_node_Val(void) {
    return Spl_quantum_reg_node_Val;
}

_TLIB static
        Tstruct Spl_quantum_reg_struct
Dummy_Spl_quantum_reg_Val(void) {
    return Spl_quantum_reg_Val;
}

_TPtr<quantum_reg>
quantum_new_qureg(MAX_UNSIGNED initval, int width)
{
    _TPtr<quantum_reg> reg = NULL;
    reg = (_TPtr<quantum_reg>)t_malloc(sizeof(quantum_reg));
    char *c;

    reg->width = width;
    reg->size = 1;
    reg->hashw = width + 2;

    reg->node = t_malloc(1 * sizeof(quantum_reg_node));
    t_memset(reg->node, 0, 1 * sizeof(quantum_reg_node));

    reg->hash = t_malloc((1 << reg->hashw)* sizeof(int));
    t_memset(reg->hash, 0, (1 << reg->hashw)* sizeof(int));
    /* Initialize the quantum register */

    reg->node[0].state = initval;
    reg->node[0].amplitude = 1;

    return reg;
}

int main() {
    Dummy_Spl_quantum_reg_node_Val();
    Dummy_Spl_quantum_reg_Val();
    quantum_new_qureg(0, 11);
    return 0;

}
