"%ProgramFiles%\Docker\Docker\DockerCli.exe" -SwitchLinuxEngine
docker pull ubuntu:20.04
docker build -t ci-yo-ubuntu:20.04 -f ci-yo-ubuntu.dockerfile --build-arg "tag=20.04" .
