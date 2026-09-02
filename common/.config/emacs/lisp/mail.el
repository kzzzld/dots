(setq gnus-select-method
      '(nnimap "kzzzl.xyz"
        (nnimap-address "kzzzl.xyz")
        (nnimap-server-port 993)
        (nnimap-stream ssl)))

(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "kzzzl.xyz"
      smtpmail-smtp-service 587
      smtpmail-stream-type 'starttls
      smtpmail-smtp-user "kzzzl")

(setq user-mail-address "kzzzl@kzzzl.xyz")
(setq user-full-name "kzzzl")

(provide 'mail)
