(ql:quickload '(#:cl-who #:cl-fad #:hunchentoot))

(dolist (x '(#:hunchentoot #:cl-who #:parenscript #:cl-fad))
  (asdf:oos 'asdf:load-op x))

(defpackage #:ps-tutorial
  (:use #:common-lisp #:hunchentoot #:cl-who #:cl-fad #:parenscript))

(in-package #:ps-tutorial)

(setf *js-string-delimiter* #\")

(start (make-instance 'acceptor :port 8080))

(define-easy-handler (tutorial1 :uri "/tutorial1") ()
  (with-html-output-to-string (s)
    (:html
     (:head (:title "Parenscript tutorial: first example"))
     (:body (:h2 "Parenscript tutorial: first example")
            "Please click the link below." :br
            (:a :href "#" :onclick (ps (alert "Hello, world!")) "Hello, world!")))))


(define-easy-handler (tutorial2 :uri "/tutorial2") ()
  (with-html-output-to-string (s)
    (:html
     (:head
      (:title "Parenscript tutorial: 2nd example")
      (:script :type "text/javascript"
               (str (ps
                      (defun greeting-callback ()
                        (alert "Hello World"))))))
     (:body
      (:h2 "Parenscript tutorial: 2nd example")
      (:a :href "#" :onclick (ps (greeting-callback))
          "Hello World")))))
