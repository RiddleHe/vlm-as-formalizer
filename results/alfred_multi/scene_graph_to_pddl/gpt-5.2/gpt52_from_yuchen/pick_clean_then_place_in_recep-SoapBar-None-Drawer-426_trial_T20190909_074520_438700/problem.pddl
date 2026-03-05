(define (problem put_task_soap_in_drawer)
  (:domain put_task)
  (:objects
    robot - agent

    long-teal-drawer-cabinet-vanity - receptacle
    round-dark-stone-sink-basin - sink
    small-black-hex-bin-left-of-sink - receptacle

    pink-bar-soap-center - object
    pink-bar-soap-right - object
    yellow-spray-bottle - object
    white-toilet-paper-roll - object
    gray-soap-dispenser-with-bronze-pump - object
    brown-toilet-brush-handle - object
    gray-rectangular-rug - object
  )

  (:init
    (openable long-teal-drawer-cabinet-vanity)

    (inReceptacle yellow-spray-bottle small-black-hex-bin-left-of-sink)
  )

  (:goal
    (and
      (isClean pink-bar-soap-center)
      (inReceptacle pink-bar-soap-center long-teal-drawer-cabinet-vanity)
    )
  )
)