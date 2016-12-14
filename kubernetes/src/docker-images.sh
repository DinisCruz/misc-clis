#!/usr/bin/env bash

# helper functions to correctly configure multiple images

function dk-gogs {
     dk-run gogs gogs/gogs 3000
}

function dk-jenkins {
    dk-run jenkins jenkins 8080
}