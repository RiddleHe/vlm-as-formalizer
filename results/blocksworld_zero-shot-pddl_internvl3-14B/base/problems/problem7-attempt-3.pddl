(define (problem stack_colors_corrected)
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
        ; Yellow on Pink on Green
        (on yellow pink)
        (on pink green)
        ; Red, Purple, Blue are on the table
        (ontable red)
        (ontable purple)
        (ontable blue)
        ; Clear blocks on the table
        (clear red)
        (clear purple)
        (clear blue)
        ; Yellow, Pink blocks are not clear
        (not (clear yellow))
        (not (clear pink))
        ; Clearness of Green is irrelevant here
        (clear green)
        ; Robot starts with an empty hand
        (handempty robot)
        (not (handfull robot))
    )
    (:goal
        (and
            ; Yellow on Pink on Green on Red on Purple on Blue
            (on yellow pink)
            (on pink green)
            (on green red)
            (on red purple)
            (on purple blue)
            ; All except the bottom block should be not clear
            (not (clear yellow))
            (not (clear pink))
            (not (clear green))
            (not (clear red))
            (not (clear purple))
            ; Blue should be on the table
            (ontable blue)
            ; Blue at the bottom should be clear
            (clear blue)
        )
    )
)