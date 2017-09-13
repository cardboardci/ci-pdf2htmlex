#!/usr/bin/env bats

@test "the image uses label-schema.org" {
    run docker inspect -f '{{ index .Config.Labels "org.label-schema.schema-version" }}' "${DOCKER_IMAGE_NAME}"
    echo "status: $status"
    echo "output: $output"
    [ "$status" -eq 0 ]
    [ "$output" = "1.0" ]
}

@test "the image has a build-date" {
    run docker inspect -f '{{ index .Config.Labels "org.label-schema.build-date" }}' "${DOCKER_IMAGE_NAME}"
    echo "status: $status"
    echo "output: $output"
    [ "$status" -eq 0 ]
    [ "$output" != "" ]
}

@test "the image has a maintainer" {
    run docker inspect -f '{{ index .Config.Labels "maintainer" }}' "${DOCKER_IMAGE_NAME}"
    echo "status: $status"
    echo "output: $output"
    [ "$status" -eq 0 ]
    [ "$output" != "" ]
}

@test "the image has a user identifier" {
    run docker inspect -f '{{ index .Config.Labels "org.doc-schema.user" }}' "${DOCKER_IMAGE_NAME}"
    echo "status: $status"
    echo "output: $output"
    [ "$status" -eq 0 ]
    [ "$output" == "9000" ]
}

@test "the image has a group identifier" {
    run docker inspect -f '{{ index .Config.Labels "org.doc-schema.group" }}' "${DOCKER_IMAGE_NAME}"
    echo "status: $status"
    echo "output: $output"
    [ "$status" -eq 0 ]
    [ "$output" == "9000" ]
}