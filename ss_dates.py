from calendar import monthrange
from datetime import datetime, timedelta


def generate_spreadsheet_dates():
    now = datetime.strptime("2030-01-01", "%Y-%m-%d").date()
    print()

    cnt_sundays = 0
    for i in range(0, 366):
        d = now + timedelta(days=i)
        if d.day == 1:
            print(d.strftime("%B"))

        print(d)
        _, days_in_month = monthrange(d.year, d.month)
        if d.weekday() == 6:
            cnt_sundays += 1
            print()
        if d.day == days_in_month:
            for __ in range(39 - days_in_month - cnt_sundays):
                print()
            cnt_sundays = 0
    return


if __name__ == "__main__":
    generate_spreadsheet_dates()
