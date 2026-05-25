"# test_other" 




set ACT_DOCKER_SOCK=\\.\pipe\docker_engine&& act push --secret-file .env.secrets --pull=false
