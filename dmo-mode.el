(defun dmo-create-for-today (number-of-tasks)
  "Create a DMO for the current day with NUMBER-OF-TASKS initial tasks."
  (interactive "p")
  (message "Number of tasks: %s" number-of-tasks))

(defun dmo-create-for-next-work-day (number-of-tasks)
  "Create a DMO for the next work day with NUMBER-OF-TASKS initial tasks."
  (interactive "p")
  (message "Number of tasks: %s" number-of-tasks))

;;;###autoload
(define-minor-mode dmo-mode
  "Manage DMOs (Daily Method of Operation) from within Org mode"
  :lighter " dmo"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-c t") 'dmo-create-for-today)
            (define-key map (kbd "C-c n") 'dmo-create-for-next-work-day)
            map))

;;;###autoload
(add-hook 'org-mode-hook 'dmo-mode)

(provide 'dmo-mode)
