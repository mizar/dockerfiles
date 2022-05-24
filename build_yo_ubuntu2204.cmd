"%ProgramFiles%\Docker\Docker\DockerCli.exe" -SwitchLinuxEngine
docker pull ubuntu:22.04
docker build -t ci-yo-ubuntu:22.04 -f ci-yo-ubuntu.dockerfile --build-arg "tag=22.04" .
