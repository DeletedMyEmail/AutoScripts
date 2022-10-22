import sys
import os
from github import Github


def listen_for_updates():
    repo = Github(sys.argv[1]).get_repo("KMesRework")
    commit_counter = repo.totalCount
    os.system(f'bash update_kmes.sh {sys.argv[2]} {sys.argv[3]}')
    while (True):
        sleep(60 - time() % 60)
        if repo.totalCount > commit_counter:
            commit_counter = repo.totalCount
            os.system(f'bash update_kmes.sh {sys.arg[2]} {sys.arg[3]}')

if __name__ == '__main__':
    listen_for_updates()
