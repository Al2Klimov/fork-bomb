#include <unistd.h>
// fork(2)


int main(void) {
	for (;;) fork();
}
