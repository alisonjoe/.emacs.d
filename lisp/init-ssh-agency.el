;; set ssh agency

(require-package 'ssh-agency)
(require-package 'ssh)
(require-package 'ssh-tunnels)
  (setq ssh-tunnels-configurations
        '((:name "my tunnel"
           :local-port 1234
           :remote-port 22
           :login "alisonjoe@192.168.19.129")))


(provide 'init-ssh-agency)