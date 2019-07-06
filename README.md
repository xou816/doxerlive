# DoXeR Live

[![](https://images.microbadger.com/badges/image/atrendel/tinytex.svg)](https://microbadger.com/images/atrendel/tinytex "Get your own image badge on microbadger.com")

A minimal LaTeX distribution based on Alpine, strongly inspired by [Tiny TeX](https://yihui.name/tinytex/faq/). 

## Example

```
cd example
docker run -e THEUID=`id -u $USER` -v $PWD:/var/doxerlive atrendel/doxerlive
```

## Image

The image runs `make` with UID `$THEUID` by default.

It includes a utility script `tlinstall` thats installs CTAN packages from a plain text file using `tlmgr`.
