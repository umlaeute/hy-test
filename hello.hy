#!/usr/bin/env hy

(import sys)

(defn simple-conversation []
   (print "Hello!  I'd like to get to know you. Tell me about yourself!")
   (setv PYVER sys.version)
   (setv OS sys.platform)
   (print (+ "Python " PYVER "! I see you are running on " OS)))


(if (= __name__ "__main__")
  (try
   (simple-conversation)
   (except [e KeyboardInterrupt] (print "\n[interrupted by user]"))))

