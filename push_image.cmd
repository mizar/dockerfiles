"%ProgramFiles%\Docker\Docker\DockerCli.exe" -SwitchLinuxEngine
docker image tag ci-yo-ubuntu:20.04 mizarjp/ci-yo-ubuntu:20.04
docker image tag ci-yo-ubuntu:22.04 mizarjp/ci-yo-ubuntu:22.04
docker image push mizarjp/ci-yo-ubuntu:20.04
docker image push mizarjp/ci-yo-ubuntu:22.04
