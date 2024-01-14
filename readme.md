# build

    docker buildx build --platform linux/amd64,linux/arm/v7 --tag ojooss/dos2unix --push  .

# use
Pass either --file or --dir followed by dos2unix parameters

    docker run --rm ojooss/dos2unix --help

    docker run --rm -v ${PWD}:/dos2unix ojooss/dos2unix --file /dos2unix/file.txt -i
    docker run --rm -v ${PWD}:/dos2unix ojooss/dos2unix --dir /dos2unix -i
