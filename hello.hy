#!/usr/bin/env hy

(defn simple-conversation []
   (print "Hello!  I'd like to get to know you.  Tell me about yourself!")
   (setv name (input "What is your name? "))
   (setv age (input "What is your age? "))
   (print (+ "Hello " name "!  I see you are "
              age " years old.")))


(if (= __name__ "__main__")
  (try
   (simple-conversation)
   (except [e KeyboardInterrupt] (print "\n[interrupted by user]"))))

