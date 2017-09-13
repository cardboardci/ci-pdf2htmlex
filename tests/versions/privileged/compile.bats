#
# Tests
#

@test "pdf to html" {
    run docker run --rm -v "${DOCKER_PATH}":/media --workdir /media "${DOCKER_IMAGE_NAME}" sh resources/compile.sh test1
    echo "status: $status"
    echo "output: $output"
    [ "$status" -eq 0 ]
}

@test "multi-page pdf to html" {
    run docker run --rm -v "${DOCKER_PATH}":/media --workdir /media "${DOCKER_IMAGE_NAME}" sh resources/compile.sh test2 
    echo "status: $status"
    echo "output: $output"
    [ "$status" -eq 0 ]
}

@test "graphics pdf to html" {
    run docker run --rm -v "${DOCKER_PATH}":/media --workdir /media "${DOCKER_IMAGE_NAME}" sh resources/compile.sh test2 
    echo "status: $status"
    echo "output: $output"
    [ "$status" -eq 0 ]
}
