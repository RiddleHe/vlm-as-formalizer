(define (problem place_two_watches_on_tv_stand)
  (:domain put_task)

  (:objects
    robot - agent

    tv_stand - receptacle
    box1 box2 box3 - receptacle

    watch1 watch2 watch3 watch4 - object
    red_item - object
  )

  (:init
    ;; Robot starts not at any object's location (so no atLocation facts for robot)

    ;; Receptacles and their states
    ;; Cardboard boxes are open-top in the scene; model them as already opened/openable.
    (openable box1)
    (openable box2)
    (openable box3)
    (opened box1)
    (opened box2)
    (opened box3)

    ;; Object locations (treat the table-top as being "at" the objects themselves;
    ;; watches are not inside any box, and nothing is on the TV stand initially)
    ;; Watches are on the dining table surface (not represented as a receptacle in this domain),
    ;; so we leave them as standalone locations to allow navigation/pickup.
    ;; (No inReceptacle relations for watches initially.)

    ;; Small red rectangular item on the table
    ;; (also not in any receptacle)
  )

  (:goal
    (and
      ;; Place any two watches on the TV stand
      (exists (?w1 - object ?w2 - object)
        (and
          (inReceptacle ?w1 tv_stand)
          (inReceptacle ?w2 tv_stand)
          (not (= ?w1 ?w2))
        )
      )
    )
  )
)