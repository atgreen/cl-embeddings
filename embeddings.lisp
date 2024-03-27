;;; embeddings.lisp
;;;
;;; SPDX-License-Identifier: MIT
;;;
;;; Copyright (C) 2024  Anthony Green <green@moxielogic.com>
;;;
;;; Permission is hereby granted, free of charge, to any person obtaining a copy
;;; of this software and associated documentation files (the "Software"), to deal
;;; in the Software without restriction, including without limitation the rights
;;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;;; copies of the Software, and to permit persons to whom the Software is
;;; furnished to do so, subject to the following conditions:
;;;
;;; The above copyright notice and this permission notice shall be included in all
;;; copies or substantial portions of the Software.
;;;
;;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;;; SOFTWARE.
;;;

(in-package :embeddings)

(defclass embeddings ()
  ())

(defclass openai-embeddings (embeddings)
  ((endpoint :initform "https://api.openai.com/v1/embeddings")
   (api-key :initarg :api-key)
   (model :initarg :model :initform "text-embedding-3-small")))

(defmethod get-embeddings ((provider openai-embeddings) text)
  (with-slots (endpoint api-key model) provider
    (let* ((headers `(("Content-Type" . "application/json")
                      ("Authorization" . ,(concatenate 'string "Bearer " api-key))))
           (payload (json:encode-json-to-string `(("input" . ,text) ("model" . ,model))))
           (response (drakma:http-request endpoint
                                          :method :post
                                          :additional-headers headers
                                          :content payload
                                          :content-type "application/json")))
      (let ((json-as-list
              (json:decode-json-from-string
               (flexi-streams:octets-to-string response :external-format :utf-8))))
        (cdr (nth 2 (cadr (cadr json-as-list))))))))
