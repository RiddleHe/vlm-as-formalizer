(define (problem blocksworld)    (:domain blocksworld)    (:objects
        red - block
        blue - block
        purple - block
        pink - block
    )
    (:init
    )
    (:goal (and 
        (on red blue)
        (on blue purple)
        (on purple pink)
      )
    ))
