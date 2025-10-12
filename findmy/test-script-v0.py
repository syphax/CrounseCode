import logging
import sys

from _login import get_account_sync

from findmy import KeyPair

# Path where login session will be stored.
# This is necessary to avoid generating a new session every time we log in.
STORE_PATH = "account.json"

# URL to LOCAL anisette server. Set to None to use built-in Anisette generator instead (recommended)
# IF YOU USE A PUBLIC SERVER, DO NOT COMPLAIN THAT YOU KEEP RUNNING INTO AUTHENTICATION ERRORS!
# If you change this value, make sure to remove the account store file.
ANISETTE_SERVER = None

# Path where Anisette libraries will be stored.
# This is only relevant when using the built-in Anisette server.
# It can be omitted (set to None) to avoid saving to disk,
# but specifying a path is highly recommended to avoid downloading the bundle on every run.
ANISETTE_LIBS_PATH = "ani_libs.bin"

logging.basicConfig(level=logging.INFO)


def fetch_reports(priv_key: str) -> int:
    # Step 0: construct an account instance
    # We use a helper for this to simplify interactive authentication
    acc = get_account_sync(STORE_PATH, ANISETTE_SERVER, ANISETTE_LIBS_PATH)

    print(f"Logged in as: {acc.account_name} ({acc.first_name} {acc.last_name})")

    # Step 1: construct a key object and get its location reports
    key = KeyPair.from_b64(priv_key)
    reports = acc.fetch_last_reports(key)

    # Step 2: print the reports!
    for report in sorted(reports):
        print(report)

        # We can save the report to a file if we want
        report.to_json("last_report.json")

    # Step 3: Make sure to save account state when you're done!
    acc.to_json(STORE_PATH)

    return 0


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(f"Usage: {sys.argv[0]} <private key>", file=sys.stderr)
        print(file=sys.stderr)
        print("The private key should be base64-encoded.", file=sys.stderr)
        sys.exit(1)

    sys.exit(fetch_reports(sys.argv[1]))
