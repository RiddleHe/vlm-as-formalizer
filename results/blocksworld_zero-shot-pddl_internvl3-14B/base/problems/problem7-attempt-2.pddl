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
        ; Yellow block is on top of Pink block, which is on Green block
        (on yellow pink)
        (on pink green)
        ; Red, Purple, Blue blocks are on the table
        (ontable red)
        (ontable purple)
        (ontable blue)
        ; All blocks on the table are clear
        (clear red)
        (clear purple)
        (clear blue)
        ; Yellow, Pink are clear only if they are not on another block
        (not (clear yellow))
        (not (clear pink))
        (clear green)
        ; Robot starts with an empty hand
        (handempty robot)
        (not (handfull robot))
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
            ; Blue at the bottom should be on the table
            (ontable blue)
        )
    )
)