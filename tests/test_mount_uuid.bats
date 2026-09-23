#!/usr/bin/env bats


@test "mount_uuid.sh exists" {

    [ -f mount_uuid.sh ]

}


@test "mount_uuid.sh executable" {

    [ -x mount_uuid.sh ]

}


@test "Uses blkid command" {

    run grep "blkid" mount_uuid.sh

    [ "$status" -eq 0 ]

}


@test "Creates mount directory" {

    run grep "/mnt/uuiddata" mount_uuid.sh

    [ "$status" -eq 0 ]

}


@test "Uses UUID mounting" {

    run grep "mount UUID=" mount_uuid.sh

    [ "$status" -eq 0 ]

}


@test "Uses df command" {

    run grep "df -h" mount_uuid.sh

    [ "$status" -eq 0 ]

}


@test "UUID placeholder exists" {

    run grep "YOUR_UUID" mount_uuid.sh

    [ "$status" -eq 0 ]

}
