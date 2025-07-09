(define (problem blocksworld)    (:domain blocksworld)    (:objects
        pink - block
        purple - block
        yellow - block
        orange - block
    )
    (:init
        (on pink yellow)
    )
    (:goal (and 
        (on pink purple)
        (on yellow orange)
      )
    ))
