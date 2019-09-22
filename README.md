# doxerlive

[![](https://images.microbadger.com/badges/image/atrendel/doxerlive.svg)](https://microbadger.com/images/atrendel/doxerlive "Get your own image badge on microbadger.com")

A minimal LaTeX distribution based on Alpine, strongly inspired by [Tiny TeX](https://yihui.name/tinytex/faq/). 

## Example

### Building

See included example:

```
cd example
docker run -e THEUID=`id -u $USER` -v $PWD:/var/doxerlive atrendel/doxerlive:9-basic
```

The `THEUID` variable makes sure processes inside the container run using the same UID as your user on the host system.

On Windows hosts, you can ignore this.

### Tips

You may also attach to the container and running with the "preview continuously" mode of Latexmk:

```
cd example
docker run --it -e THEUID=`id -u $USER` -v $PWD:/var/doxerlive atrendel/doxerlive:9-basic ash # launch ash shell
```

Then, from inside the container:

```
make watch
```

## Images

All images run `make` with UID `$THEUID` by default.

Tags:
- `9-infraonly`: base image with Alpine 3.9, almost no packages and only essential binaires
- `9-basic`: larger image with basic utilities on top of `9-infraonly`

