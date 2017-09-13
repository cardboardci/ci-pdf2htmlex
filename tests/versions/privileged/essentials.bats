#!/usr/bin/env bats

@test "user is root" {
    run docker run --rm "${DOCKER_IMAGE_NAME}" id -u
    echo "status: $status"
    echo "output: $output"
    [ "$output" == "0" ]
}

@test "apt-get is enabled" {
    run docker run --rm "${DOCKER_IMAGE_NAME}" apt-get update
    echo "status: $status"
    echo "output: $output"
    [ "$status" -eq 0 ]
}

@test "pdfhtmlex is installed" {
	run docker run --rm --entrypoint sh "${DOCKER_IMAGE_NAME}" -c "which pdfhtmlex"
    echo "status: $status"
    [ "$status" -eq 0 ]
}

@test "bash is installed" {
	run docker run --rm --entrypoint sh "${DOCKER_IMAGE_NAME}" -c "which bash"
    echo "status: $status"
    [ "$status" -eq 0 ]
}

@test "cache is empty" {
    run docker run --rm --entrypoint sh "${DOCKER_IMAGE_NAME}" -c "ls -1 /var/lib/apt/lists/ | wc -l"
    echo "status: $status"
    [ "$status" -eq 0 ]
}

@test "tmp is empty" {
    run docker run --rm --entrypoint sh "${DOCKER_IMAGE_NAME}" -c "ls -1 /var/tmp/ | wc -l"
    echo "status: $status"
    [ "$status" -eq 0 ]
}
