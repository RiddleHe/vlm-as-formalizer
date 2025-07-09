(define (problem blocksworld)    (:domain blocksworld)    (:objects
        yellow - block
        green - block
        pink - block
        red - block
        purple - block
    )
    (:init
        (ontable yellow)
        (ontable green)
        (ontable pink)
        (clear yellow)
    )
    (:goal (and 
        (on yellow green)
        (on green pink)
        (on red purple)
      )
    ))
