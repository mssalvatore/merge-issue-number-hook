import sys
import re


def main():
    commit_msg_file = sys.argv[1]

    if "MERGE_MSG" not in commit_msg_file:
        exit()

    with open(commit_msg_file, "r") as f:
        subject = f.readline()

    m = re.match(r"Merge branch '(\d+)-", subject)
    if not m:
        exit()

    issue_number = m.group(1)

    with open(commit_msg_file, "w") as f:
        f.write(subject)
        f.write("\n")
        f.write(f"Issue #{issue_number}")


if __name__ == "__main__":
    main()
