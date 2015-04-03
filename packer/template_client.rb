log_level        :info
log_location     STDOUT
chef_server_url  "{{.ServerUrl}}"
validation_client_name "mu-validator"
{{if ne .ValidationKeyPath ""}}
validation_key "{{.ValidationKeyPath}}"
{{end}}
node_name "{{.NodeName}}"
ssl_verify_mode :verify_none
file_atomic_update false
