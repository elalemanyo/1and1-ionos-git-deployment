<p align='center'>
  <img alt="1&1 + GIT" width="400" height="59" src="assets/ionos%2Bgit.svg">
</p>

## 1&1 IONOS Git deployment
Using 1&1 IONOS git repository for website deployment

### SSH into your 1&1 account
For host name, type the host name displayed in IONOS (e.g. home.xxxxxxxxx.1and1-data.host).
The ssh username is the same as the main FTP user. This is the only username that has ssh access.

`ssh username@home.xxxxxxxxx.1and1-data.host`

### Create deployment script
```shell
cd ~
mkdir lib
cd lib
nano post-receive.sh
```

Copy code from `post-receive.sh`, and after saving make sure the `post-receive.sh` script is executable by running: `chmod +x post-receive.sh`

### Create bare repository
```shell
mkdir repositories
cd repositories
git init --bare my_repo.git
```

### Create post-receive git hook
```
cd my_repo.git/hooks
nano post-receive
```

Inside pase this code:

```shell
#!/bin/sh
. ~/lib/post-receive.sh
```

And make sure the post-receive hook script is executable:

```shell
chmod +x post-receive
```

### Clone repository on your local machine
`git clone ssh://username@home.xxxxxxxxx.1and1-data.host/~/repositories/my_repo.git`

### Or add remote location for an existing repository
`git remote add origin ssh://username@home.xxxxxxxxx.1and1-data.host/~/repositories/my_repo.git`

### After push
Find your deployed code here: `~/www/[repo_name]/[branch]`

