# AutoScripts

## About The Project

You want to automate processes? That's what this repo is for :)

## Getting Started

### Initializing Repos
Execute the [repo_creator](RepoCreator/repo_creator.sh) in the directory where you want to create a new repository. 

It takes the following arguments:
- GitHub username
- Github token
- Repo name
- Visibility (public or private)

This what's going to happen:

- new directory is created if it doesn't already exist
- git repo is initialised
- repo is created on GitHub and added as remote,
- readme file is created 
- first commit is made.

### Updating KMes Server
Execute the [kmes_updater](KMesUpdater/kmes_updater.py) 

It takes the following arguments:
- Path to kmes repo
- Port on which the server runs


