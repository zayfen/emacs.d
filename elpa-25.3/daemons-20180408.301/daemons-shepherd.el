;;; daemons-shepherd.el --- UI for managing init system daemons (services) -*- lexical-binding: t -*-

;; Copyright (c) 2018 Jelle Licht <jlicht@fsfe.org>
;;
;; Author: Jelle Licht
;; URL: https://github.com/cbowdon/daemons.el
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3
;;
;; Created: March 07, 2018
;; Modified: March 07, 2018
;; Version: 1.2.0
;; Keywords: unix convenience
;; Package-Requires: ((emacs "25"))
;;
;;; Commentary:
;; This file provides GNU Shepherd support for daemons.el.

;;; Code:
(require 'seq)
(require 'daemons)

(defvar daemons-shepherd--commands-alist
  '((status . (lambda (name) (format "herd status %s" name)))
    (start . (lambda (name) (format "herd start %s" name)))
    (stop . (lambda (name) (format "herd stop %s" name)))
    (restart . (lambda (name) (format "herd restart %s" name))))
  "Daemons commands alist for the GNU Shepherd.")

(defun daemons-shepherd--parse-list-item (raw-shepherd-output)
  "Parse a single line from RAW-SHEPHERD-OUTPUT into a tabulated list item."
  (let* ((parts (split-string raw-shepherd-output))
         (name (cadr parts))
         (running (car parts)))
    (list name (vector
                name
                (if (string-match-p "^\+" running)
                    "started"
                  "stopped")))))

(defun daemons-shepherd--item-is-service-p (item)
  "Non-nil if ITEM (output-line of `herd status root') describes a service."
  (string-match-p "^ [\+\-] " item))

(defun daemons-shepherd--list ()
  "Return a list of daemons on a shepherd system."
  (thread-last  "herd status"
    (daemons--shell-command-to-string)
    (daemons--split-lines)
    (seq-filter 'daemons-shepherd--item-is-service-p)
    (seq-map 'daemons-shepherd--parse-list-item)))

(defun daemons-shepherd--list-headers ()
  "Return the list of headers for a shepherd ‘daemons-mode’ buffer."
  [("Daemon (service)" 60 t)
   ("Active" 40 t)])

(setq daemons--commands-alist daemons-shepherd--commands-alist
      daemons--list-fun 'daemons-shepherd--list
      daemons--list-headers-fun 'daemons-shepherd--list-headers)

(provide 'daemons-shepherd)
;;; daemons-shepherd.el ends here
