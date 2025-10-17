// JMJ
// Reference: https://en.cppreference.com/w/c/chrono/timespec

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include <unistd.h>

static void get_timestamp(char *ts, unsigned);

static void monotonic_sleep(long seconds);

int main(void)
{
	char ts[32] = { '\0' };

	// initialize timestamp for logging.
	get_timestamp(NULL, 0);

	for (int i = 0; i < 10; i++) {
		get_timestamp(ts, 32);
		monotonic_sleep(2L);
		puts(ts);
	}

	exit(EXIT_SUCCESS);
}

static void get_timestamp(char *ts, unsigned n)
{
	static bool initialized = false;
	static struct timespec start_of_day;
	struct timespec curr;

	if (!initialized) {
		if (clock_gettime(CLOCK_MONOTONIC, &start_of_day) != 0) {
			perror("clock_gettime()");
			exit(EXIT_FAILURE);
		}
		initialized = true;
	}

	if (ts == NULL) {
		return;
	}

	if (clock_gettime(CLOCK_MONOTONIC, &curr) != 0) {
		perror("clock_gettime()");
		exit(EXIT_FAILURE);
	}

	snprintf(ts, n, "[%5ld.%.6ld]",
		 (curr.tv_sec - start_of_day.tv_sec),
		 (curr.tv_nsec - start_of_day.tv_nsec) / 1000);
	ts[n - 1] = '\0';

	return;
}

static void monotonic_sleep(long seconds)
{
	struct timespec ts = {
		.tv_sec = seconds,
		.tv_nsec = 0L,
	};

	clock_nanosleep(CLOCK_MONOTONIC, 0, &ts, NULL);
	return;
}
