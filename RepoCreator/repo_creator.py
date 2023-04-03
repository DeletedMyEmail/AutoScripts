import sys
from github import Github

def create_repo():
    try:
        repo_name: str = sys.argv[1]
        user = Github(sys.argv[2]).get_user()
        isPrivateRepo = sys.argv[3] == "private"
    
        if (user.get_repo(repo_name) != None):
            print("-----------------------------")
            print(f"Repo {repo_name} already exists")
        else:
            user.create_repo(repo_name, private=isPrivateRepo)
            print("-----------------------------")
            print(f"\nSuccessfully created and pushed repo: {repo_name}")
    
    except Exception as error:
        print("\nCould not create repo")
        print(error)


if __name__ == '__main__':
    create_repo()
