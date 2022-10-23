import sys
import os
from time import sleep

from github import Github


def listen_for_updates():
    g = Github()
    repo = g.get_repo("KaitoKunTatsu/KMesRework")
    last_jar_name = ""
    for file in repo.get_files():
        if file.filename.startswith("KMesServer"):
            last_jar_name = file.filename
            break

    os.system(f'bash kmes_updater.sh {sys.argv[2]} {sys.argv[3]}')

    while (True):
        sleep(60)
        for file in repo.get_files():
            if file.filename.startswith("KMesServer"):
                if file.filename != last_jar_name:
                    last_jar_name = file.filename
                    os.system(f'bash kmes_updater.sh {sys.argv[1]} {sys.argv[2]}')
            break


if __name__ == '__main__':
    listen_for_updates()
