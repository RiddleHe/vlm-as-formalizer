(define (problem stack_colors)
    (:domain blocksworld)
    (:objects
        yellow - block
        pink - block
        green - block
        red - block
        purple - block
        blue - block
        robot - robot
    )
    (:init
        ; Yellow block is on top of Green block
        (on yellow pink)
        (on pink green)
        ; Green is on table
        (ontable green)
        ; Clear status of the blocks on the table
        (clear red)
        (clear purple)
        (clear blue)
        ; Red and Orange start as clear
        ; Purple and Blue start on table
        (ontable red)
        (ontable purple)
        (ontable blue)
        ; Robot starts with an empty hand
        (handempty robot)
        (handfull robot)
    )
    (:goal
        (and
            ; Goal: Yellow over Pink over Green over Red over Purple over Blue
            (on yellow pink)
            (on pink green)
            (on green red)
            (on red purple)
            (on purple blue)
            (clear yellow)
            ; All blocks below Yellow should be on blocks rather than table
            (ontable blue)
        )
    )
)