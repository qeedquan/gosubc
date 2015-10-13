/*
 *	NMH's Simple C Compiler, 2012
 *	ctime()
 */

#include <time.h>
#include <stdio.h>

#define S_MIN	60
#define S_HOUR	(60*S_MIN)
#define S_DAY	(24*S_HOUR)
#define S_YEAR	(365*S_DAY)

static int	ndays[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

char *ctime(int t) {
	static char	buf[100];
	int		m, t2, t3;
	int		wday, year, yday, mon, mday, hour, min, sec;
	char		*days, *months;

	days = "Sun\0Mon\0Tue\0Wed\0Thu\0Fri\0Sat";
	months = "Jan\0Feb\0Mar\0Apr\0May\0Jun\0Jul\0Aug\0Sep\0Oct\0Nov\0Dec";
	wday = (t / S_DAY + 4) % 7;
	year = t / S_YEAR;
	t -= year * S_YEAR;
	t -= (year+2)/4 * S_DAY;
	year += 1970;
	yday = t / S_DAY;
	m = 1;
	t3 = t2 = 0;
	while (t2 <= t) {
		t3 = t2;
		t2 += ndays[m++-1] * S_DAY;
	}
	mon = m-1;
	t -= t3;
	mday = t / S_DAY;
	t -= (mday * S_DAY);
	mday++;
	hour = t / S_HOUR;
	t -= hour * S_HOUR;
	min = t / S_MIN;
	t -= min * S_MIN;
	sec = t;
	sprintf(buf, "%s %s %2d %2d:%02d:%02d %04d\n",
		days + wday*4,
		months + (mon-1)*4,
		mday+1,
		hour, min, sec,
		year);
	return buf;
}
