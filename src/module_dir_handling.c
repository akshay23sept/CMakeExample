#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>

void dir_create(char *path)
{
    DIR* dir = opendir(path);
    if(dir) {
        printf("Folder already exist\n");
        closedir(dir);
    }
    else {
        printf("Folder does not exist\n");
        int result = mkdir(path, 0777);
        printf("Folder created\n");
    }
}

int dir_check(char *path)
{
    DIR* dir = opendir(path);
    if(dir) {
        return 1;
    }
    else {
        return 0;
    }
}
