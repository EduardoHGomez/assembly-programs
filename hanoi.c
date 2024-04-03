#include <stdio.h>

void pm(int start, int end) {
    // Every pm represents that the top of start moves to three

    printf("%d => %d\n", start, end);
    return;
}


void hanoi(int n, int start, int end) {
    if (n == 1)
        pm(start, end);
    else {
        int other = 6 - (start + end);
        hanoi(n-1, start, other);
        pm(start, end);
        hanoi(n-1, other, end);
    }

}



int main() {
    int N = 7;
    hanoi(N, 1, 3);
    return 0;
}


/*
def hanoi(n, start, end)
    if n == 1:
        pm(start, end)
    else:
        other = 6 - (start + end)
        hanoi(n-1, start, other)
        pm(start, end)
        hanoi(n-1, other, end)



*/