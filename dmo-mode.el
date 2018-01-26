(require 'org)

(defvar dmo-base-directory "~/"
  "The base directory in which to find / store your DMO files.
Must end with a '/' so as to be properly recognized.")

(defun dmo--create-dmo-file ()
  (concat dmo-base-directory
          "/"
          (format-time-string "%Y")
          "/"
          (format-time-string "%m")
          "/"
          (format-time-string "%d")
          ".org"))

(defun dmo-create-for-today (number-of-tasks)
  "Create a DMO for the current day with NUMBER-OF-TASKS initial tasks."
  (interactive "p")
  (with-temp-file (create-file-buffer (dmo--create-dmo-file))
    (org-insert-heading)
    (insert "Tasks")
    (org-insert-todo-subheading nil)
    (insert "[%] Title goes here...")
    (org-deadline nil "+1")
    (org-schedule nil "")))

(defun dmo-create-for-next-work-day (number-of-tasks)
  "Create a DMO for the next work day with NUMBER-OF-TASKS initial tasks."
  (interactive "p")
  (message "Number of tasks: %s" number-of-tasks))

;;;###autoload
(define-minor-mode dmo-mode
  "Manage DMOs (Daily Methods of Operation) from within Org mode"
  :lighter " dmo"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-c t") 'dmo-create-for-today)
            (define-key map (kbd "C-c n") 'dmo-create-for-next-work-day)
            map))

;;;###autoload
(add-hook 'org-mode-hook 'dmo-mode)

(provide 'dmo-mode)
