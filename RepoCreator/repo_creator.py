import sys
from github import Github


def create_repo():
    repo_name: str = sys.argv[1]
    user = Github(sys.argv[2]).get_user()
    user.create_repo(repo_name)


if __name__ == '__main__':
    create_repo()
