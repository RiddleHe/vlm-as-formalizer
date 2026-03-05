(define (problem put_task_book_desk_to_bed)
  (:domain put_task)
  (:objects
    robot - agent
    desk - receptacle
    bed - receptacle
    book - object
  )

  (:init
    ;; receptacle relationships (book is on/in the desk surface)
    (inReceptacle book desk)
  )

  (:goal
    (and
      (inReceptacle book bed)
    )
  )
)