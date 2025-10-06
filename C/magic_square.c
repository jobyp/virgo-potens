// JMJ

#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

#define N 4

int main(void)
{
	int square[N][N] = { 0 };
	int rows[N] = { 0 };
	int cols[N] = { 0 };
	int diagonals[2] = { 0 };
	int magic_sum = (N * (N * N + 1)) / 2;
	bool magic_square = true;

	printf("Enter the numbers 1 to %d in any order:\n", (N * N));

	for (int i = 0; i < N; i++) {
		for (int j = 0; j < N; j++) {
			assert(scanf("%d", &square[i][j]) == 1);
		}
	}

	// calculate sum of rows.
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < N; j++) {
			rows[i] += square[i][j];
		}
	}

	// print row sums.
	printf("Row sums:");
	for (int i = 0; i < N; i++) {
		printf(" %d", rows[i]);
		magic_square &= (rows[i] == magic_sum);
	}
	puts("");

	// calculate sum of cols
	for (int j = 0; j < N; j++) {
		for (int i = 0; i < N; i++) {
			cols[j] += square[i][j];
		}
	}

	// print cols sums.
	printf("Column sums:");
	for (int j = 0; j < N; j++) {
		printf(" %d", cols[j]);
		magic_square &= (cols[j] == magic_sum);
	}
	puts("");

	// calculate sum of diagonals.
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < N; j++) {
			if (i == j) {
				diagonals[0] += square[i][j];
			}
			if ((i + j) == (N - 1)) {
				diagonals[1] += square[i][j];
			}
		}
	}

	// print diagonal sums.
	printf("Diagonal sums:");
	for (int k = 0; k < 2; k++) {
		printf(" %d", diagonals[k]);
		magic_square &= (diagonals[k] == magic_sum);
	}
	puts("");

	if (magic_square) {
		puts("We have a magic square!");
	} else {
		puts("We don't have a magic square!");
	}

	return 0;
}

/* Sample input, which is a magic square (for size 4) */
/* echo 16 3 2 13 5 10 11 8 9 6 7 12 4 15 14 1 | ./magic_square */
