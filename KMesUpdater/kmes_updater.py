import sys
import os
from time import sleep

from github import Github


def listen_for_updates():
    g = Github()
    repo = g.get_repo("KaitoKunTatsu/KMesRework")
    last_commit_counter = len(repo.get_commits())

    os.system(f'bash kmes_updater.sh {sys.argv[2]} {sys.argv[3]}')

    while (True):
        sleep(60)
        if len(repo.get_commits) > last_commit_counter:
            last_commit_counter = len(repo.get_commits())
            os.system(f'bash kmes_updater.sh {sys.argv[1]} {sys.argv[2]}')


if __name__ == '__main__':
    listen_for_updates()
