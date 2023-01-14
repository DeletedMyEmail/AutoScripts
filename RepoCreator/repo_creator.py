import sys
from github import Github

def create_repo():
    try:
        repo_name: str = sys.argv[1]
        user = Github(sys.argv[2]).get_user()
        isPrivateRepo = sys.argv[3] == "private"
        user.create_repo(repo_name, private=isPrivateRepo)
    except Exception as error:
        print("\nInvalid credentials, could not create repo")
        print(error)


if __name__ == '__main__':
    create_repo()
