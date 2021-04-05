So here's is all the commands that you need to do to
use git correctly. Trust me, it will save your time
after this.

A.  After setting up your git 

    1. First, make a directory for for repository.
        
        $ mkdir My_git_project

    2. Second, make an another directory where you
    actually put your files onto.

        $ mkdir My_cfgl

    3. Third create initialize your git by doing this.

        $ git init

    This will initialized what is inside the folder or
    directory so it will recognized as a repository.

    4. Fourth, add the files that you want.

        $ git add.      or      git add "name_of_the_file"

    This will add to your cached data so you can commit
    them to your repository on GitHub.

    If you accidentally add a wrong file by typing this
    on to your terminal

        $ git rm --cached "file_name"
    
    5. Fifth, now you must commit a message in order to
    push your files to your repository on GitHub.

        $ git commit -m 'new updates'

    6. Sixth, you need to remote origin to your local
    repository in order to actually work

        $ git remote add origin <link to your repository>

    7. Then lastly, push your files to GitHub and see if
    that works.

        git push -u -f origin master    or
        git push -u origin master



B.  What if you want to push your files to the existing
    repository?

    Simple, git push -u -f origin master again to rewrite
    your GitHub repository. Just make sure that you are
    done modifying your file.

    $ git push
