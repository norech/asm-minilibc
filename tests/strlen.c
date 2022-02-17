#include <dlfcn.h>
#include <stdio.h>
#include <assert.h>

int main()
{
    void *dl = dlopen("./libasm.so", RTLD_LAZY);
    size_t (*strlen)(const char *) = dlsym(dl, "strlen");
    assert(strlen("Hello") == 5);
    assert(strlen("Hi") == 2);
    assert(strlen("") == 0);
    assert(strlen("In the observable universe, there are billion stars") == 51);
    printf("strlen: OK\n");
    dlclose(dl);
}
