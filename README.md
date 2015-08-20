# nodebuild
Docker images to provide help in build, ci and related tooling for nodejs projects

## How to run nodejs builds

```
	> docker run -v "$PWD:/src" nodebuild:latest 

```

Mount the current working directory as an /src volume in the container so that the nodebuild will know where to look for the application package.json.

If you would want to build another project other than the PWD, present working directory, specify the mount path as 

```
	> docker run -v "<project to build>:/src" nodebuild:latest

```

